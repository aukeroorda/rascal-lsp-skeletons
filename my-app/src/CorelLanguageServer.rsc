module CorelLanguageServer

import Syntax;
import RascalJavaBindings;

import util::IDEServices;
import util::LanguageServer;
import util::Reflective;
import ParseTree;


set[LanguageService] picoLanguagecontributor() = {
    parser(Tree (str input, loc src) {
        return parse(#start[Machine], input, src);
    }),
    outliner(picoOutliner),
    summarizer(picoSummarizer),
    lenses(picoLenses),
    executor(picoCommands),
    inlayHinter(picoHinter)
};

list[DocumentSymbol] picoOutliner(start[Machine] input)
    = [symbol("<input.src>", \file(), input.src, children=[
        *[symbol("<state.name>", \variable(), state.src) | /State state := input]
    ])];

Summary picoSummarizer(loc l, start[Machine] input) {
    rel[str, loc] defs = {<"<state.name>", state.src> | /State state := input};
    rel[loc, str] uses = {<id.src, "<id>"> | /Id id := input};
    rel[loc, str] docs = {<var.src, "*variable* <var>"> | /State var := input};

    // Usecase: Computing messages/docs using java libraries:
    str result = frink_parse("1/2 cup");

    return summary(l,
        references = (uses o defs)<1,0>,
        definitions = uses o defs,
        documentation = (uses o defs) o docs
    );
}

data Command
     = renameAtoB(start[Machine] machine);

rel[loc, Command] picoLenses(start[Machine] input) = {<input@\loc, renameAtoB(input, title="Rename variables a to b.")>};

list[InlayHint] picoHinter(start[Machine] input) {
    // typeLookup = ( "<name>" : "<tp>" | /(IdType)`<Id name> : <Type tp>` := input);

    // return [
    //     hint(name.src, ": <typeLookup["<name>"]>", \type()) | /(Expression)`<Id name>` := input
    // ];
    return [hint(state.src, "very nice state", \type()) | /State state := input];
}

list[DocumentEdit] getAtoBEdits(start[Machine] input)
    = [changed(input@\loc.top, [replace(id@\loc, "b") | /id:(Id) `a` := input])];

void picoCommands(renameAtoB(start[Machine] input)) {
    applyDocumentsEdits(getAtoBEdits(input));
}

void main() {
    registerLanguage(
        language(
            getProjectPathConfig(|project://my-app/|),
            "StateMachineLanguage",     // Name of the language
            "pico",                     // Extension of source files
            "CorelLanguageServer",      // Module that is imported for the DSL
            "picoLanguagecontributor"   // Main function to call with the contributions of this DSL
        )
    );
}