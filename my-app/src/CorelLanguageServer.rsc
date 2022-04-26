module CorelLanguageServer

import Syntax;

import util::LanguageServer;
import util::IDEServices;
import util::Reflective;
import ParseTree;


set[LanguageService] picoLanguagecontributor() = {
    parser(Tree (str input, loc src) {
        return parse(#start[Program], input, src);
    }),
    outliner(picoOutliner),
    summarizer(picoSummarizer),
    lenses(picoLenses),
    executor(picoCommands),
    inlayHinter(picoHinter)
};

list[DocumentSymbol] picoOutliner(start[Program] input)
    = [symbol("<input.src>", \file(), input.src, children=[
        *[symbol("<var.id>", \variable(), var.src) | /IdType var := input]
    ])];

Summary picoSummarizer(loc l, start[Program] input) {
    rel[str, loc] defs = {<"<var.id>", var.src> | /IdType var := input};
    rel[loc, str] uses = {<id.src, "<id>"> | /Id id := input};
    rel[loc, str] docs = {<var.src, "*variable* <var>"> | /IdType var := input};

    return summary(l,
        references = (uses o defs)<1,0>,
        definitions = uses o defs,
        documentation = (uses o defs) o docs
    );
}

data Command
     = renameAtoB(start[Program] program);

rel[loc, Command] picoLenses(start[Program] input) = {<input@\loc, renameAtoB(input, title="Rename variables a to b.")>};

list[InlayHint] picoHinter(start[Program] input) {
    typeLookup = ( "<name>" : "<tp>" | /(IdType)`<Id name> : <Type tp>` := input);

    return [
        hint(name.src, ": <typeLookup["<name>"]>", \type()) | /(Expression)`<Id name>` := input
    ];
}

list[DocumentEdit] getAtoBEdits(start[Program] input)
    = [changed(input@\loc.top, [replace(id@\loc, "b") | /id:(Id) `a` := input])];

void picoCommands(renameAtoB(start[Program] input)) {
    applyDocumentsEdits(getAtoBEdits(input));
}

void main() {
    registerLanguage(
        language(
            pathConfig(),
            "Pico",
            "pico",
            "LanguageServer",
            "picoLanguagecontributor"
        )
    );
}