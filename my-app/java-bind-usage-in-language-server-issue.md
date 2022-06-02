When a language server uses java bindings, the language server is unable to find?/compile? the java sources


Log:
2022-05-05 11:23:32,827 main DEBUG null 2.1.1-SNAPSHOT initializing configuration org.apache.logging.log4j.core.config.builder.impl.BuiltConfiguration@198b6731
2022-05-05 11:23:32,846 main DEBUG Installed 1 script engine
2022-05-05 11:23:33,250 main DEBUG Attempting to use org.apache.logging.log4j.jul.CoreLoggerAdapter
2022-05-05 11:23:33,256 main INFO Registered Log4j as the java.util.logging.LogManager.
WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
Warning: Nashorn engine is planned to be removed from a future JDK release
2022-05-05 11:23:33,738 main DEBUG Oracle Nashorn version: 11.0.14.1, language: ECMAScript, threading: Not Thread Safe, compile: true, names: [nashorn, Nashorn, js, JS, JavaScript, javascript, ECMAScript, ecmascript], factory class: jdk.nashorn.api.scripting.NashornScriptEngineFactory
2022-05-05 11:23:33,739 main DEBUG PluginManager 'Core' found 127 plugins
2022-05-05 11:23:33,739 main DEBUG PluginManager 'Level' found 0 plugins
2022-05-05 11:23:33,742 main DEBUG PluginManager 'Lookup' found 16 plugins
2022-05-05 11:23:33,746 main DEBUG Building Plugin[name=AppenderRef, class=org.apache.logging.log4j.core.config.AppenderRef].
2022-05-05 11:23:33,778 main DEBUG PluginManager 'TypeConverter' found 26 plugins
2022-05-05 11:23:33,793 main DEBUG createAppenderRef(ref="Console", level="null", Filter=null)
2022-05-05 11:23:33,793 main DEBUG Building Plugin[name=root, class=org.apache.logging.log4j.core.config.LoggerConfig$RootLogger].
2022-05-05 11:23:33,796 main DEBUG createLogger(additivity="null", level="DEBUG", includeLocation="null", ={Console}, ={}, Configuration(DefaultLogger), Filter=null)
2022-05-05 11:23:33,801 main DEBUG Building Plugin[name=loggers, class=org.apache.logging.log4j.core.config.LoggersPlugin].
2022-05-05 11:23:33,802 main DEBUG createLoggers(={root})
2022-05-05 11:23:33,802 main DEBUG Building Plugin[name=layout, class=org.apache.logging.log4j.core.layout.PatternLayout].
2022-05-05 11:23:33,814 main DEBUG PatternLayout$Builder(pattern="%d [%t] %p - %c %m%n", PatternSelector=null, Configuration(DefaultLogger), Replace=null, charset="null", alwaysWriteExceptions="null", disableAnsi="null", noConsoleNoAnsi="null", header="null", footer="null")
2022-05-05 11:23:33,816 main DEBUG PluginManager 'Converter' found 45 plugins
2022-05-05 11:23:33,833 main DEBUG Building Plugin[name=appender, class=org.apache.logging.log4j.core.appender.ConsoleAppender].
2022-05-05 11:23:33,838 main DEBUG ConsoleAppender$Builder(target="SYSTEM_ERR", follow="null", direct="null", bufferedIo="null", bufferSize="null", immediateFlush="null", ignoreExceptions="null", PatternLayout(%d [%t] %p - %c %m%n), name="Console", Configuration(DefaultLogger), Filter=null, ={})
2022-05-05 11:23:33,843 main DEBUG Starting OutputStreamManager SYSTEM_ERR.false.false
2022-05-05 11:23:33,844 main DEBUG Building Plugin[name=appenders, class=org.apache.logging.log4j.core.config.AppendersPlugin].
2022-05-05 11:23:33,844 main DEBUG createAppenders(={Console})
2022-05-05 11:23:33,845 main DEBUG Configuration org.apache.logging.log4j.core.config.builder.impl.BuiltConfiguration@198b6731 initialized
2022-05-05 11:23:38,897 main DEBUG Starting configuration org.apache.logging.log4j.core.config.builder.impl.BuiltConfiguration@198b6731
2022-05-05 11:23:38,898 main DEBUG Started configuration org.apache.logging.log4j.core.config.builder.impl.BuiltConfiguration@198b6731 OK.
2022-05-05 11:23:38,899 main DEBUG Shutting down OutputStreamManager SYSTEM_OUT.false.false-1
2022-05-05 11:23:38,900 main DEBUG OutputStream closed
2022-05-05 11:23:38,900 main DEBUG Shut down OutputStreamManager SYSTEM_OUT.false.false-1, all resources released: true
2022-05-05 11:23:38,901 main DEBUG Appender DefaultConsole-1 stopped with status true
2022-05-05 11:23:38,901 main DEBUG Stopped org.apache.logging.log4j.core.config.DefaultConfiguration@1f021e6c OK
2022-05-05 11:23:38,985 main DEBUG Registering MBean org.apache.logging.log4j2:type=277050dc
2022-05-05 11:23:38,988 main DEBUG Registering MBean org.apache.logging.log4j2:type=277050dc,component=StatusLogger
2022-05-05 11:23:38,989 main DEBUG Registering MBean org.apache.logging.log4j2:type=277050dc,component=ContextSelector
2022-05-05 11:23:38,991 main DEBUG Registering MBean org.apache.logging.log4j2:type=277050dc,component=Loggers,name=
2022-05-05 11:23:38,992 main DEBUG Registering MBean org.apache.logging.log4j2:type=277050dc,component=Appenders,name=Console
2022-05-05 11:23:38,996 main DEBUG org.apache.logging.log4j.core.util.SystemClock does not support precise timestamps.
2022-05-05 11:23:38,999 main DEBUG Reconfiguration complete for context[name=277050dc] at URI NULL_SOURCE (org.apache.logging.log4j.core.LoggerContext@76c3e77a) with optional ClassLoader: null
2022-05-05 11:23:39,000 main DEBUG Shutdown hook enabled. Registering a new one.
2022-05-05 11:23:39,001 main DEBUG LoggerContext[name=277050dc, org.apache.logging.log4j.core.LoggerContext@76c3e77a] started OK.
2022-05-05 11:23:39,010 [main] INFO - org.rascalmpl.vscode.lsp.BaseLanguageServer Starting Rascal Language Server: 2.1.1-SNAPSHOT at ${maven.build.timestamp}
INFO: detected |lib://rascal-lsp| at |jar+file:///Users/auke/.vscode/extensions/usethesource.rascalmpl-0.2.1/assets/jars/rascal-lsp.jar!/|
INFO: detected |lib://rascal| at |jar+file:///Users/auke/.vscode/extensions/usethesource.rascalmpl-0.2.1/assets/jars/rascal.jar!/|
INFO: detected |lib://rascal-core| at |jar+file:///Users/auke/.vscode/extensions/usethesource.rascalmpl-0.2.1/assets/jars/rascal-core.jar!/|
INFO: detected |lib://typepal| at |jar+file:///Users/auke/.vscode/extensions/usethesource.rascalmpl-0.2.1/assets/jars/typepal.jar!/|
2022-05-05 11:23:39,453 [pool-3-thread-1] INFO - org.rascalmpl.vscode.lsp.BaseLanguageServer.ActualLanguageServer LSP connection started
2022-05-05 11:23:39,469 [pool-3-thread-1] DEBUG - org.rascalmpl.vscode.lsp.BaseLanguageServer.ActualLanguageServer Initialized LSP connection with capabilities: InitializeResult [
  capabilities = ServerCapabilities [
    textDocumentSync = Either [
      left = Full
      right = null
    ]
    hoverProvider = Either [
      left = true
      right = null
    ]
    completionProvider = null
    signatureHelpProvider = null
    definitionProvider = Either [
      left = true
      right = null
    ]
    typeDefinitionProvider = null
    implementationProvider = Either [
      left = true
      right = null
    ]
    referencesProvider = Either [
      left = true
      right = null
    ]
    documentHighlightProvider = null
    documentSymbolProvider = Either [
      left = true
      right = null
    ]
    workspaceSymbolProvider = null
    codeActionProvider = null
    codeLensProvider = CodeLensOptions [
      resolveProvider = false
      workDoneProgress = null
    ]
    documentFormattingProvider = null
    documentRangeFormattingProvider = null
    documentOnTypeFormattingProvider = null
    renameProvider = null
    documentLinkProvider = null
    colorProvider = null
    foldingRangeProvider = Either [
      left = true
      right = null
    ]
    declarationProvider = null
    executeCommandProvider = ExecuteCommandOptions [
      commands = SingletonList (
        "rascal-meta-command"
      )
      workDoneProgress = null
    ]
    workspace = WorkspaceServerCapabilities [
      workspaceFolders = WorkspaceFoldersOptions [
        supported = true
        changeNotifications = Either [
          left = null
          right = true
        ]
      ]
      fileOperations = null
    ]
    typeHierarchyProvider = null
    callHierarchyProvider = null
    selectionRangeProvider = null
    linkedEditingRangeProvider = null
    semanticTokensProvider = SemanticTokensWithRegistrationOptions [
      legend = SemanticTokensLegend [
        tokenTypes = ArrayList (
          "entity.name",
          "entity.other.inherited-class",
          "entity.name.section",
          "entity.name.tag",
          "entity.other.attribute-name",
          "variable",
          "variable.language",
          "variable.parameter",
          "variable.function",
          "constant",
          "constant.numeric",
          "constant.language",
          "constant.character.escape",
          "storage.type",
          "storage.modifier",
          "support",
          "keyword",
          "keyword.control",
          "keyword.operator",
          "keyword.declaration",
          "string",
          "comment",
          "invalid",
          "invalid.deprecated",
          "comment.block.documentation",
          "comment.block",
          "comment.single",
          "comment",
          "constant.character.escape",
          "constant.language",
          "constant.numeric.complex.imaginary",
          "constant.numeric.complex.real",
          "constant.numeric.complex",
          "constant.numeric.float.binary",
          "constant.numeric.float.decimal",
          "constant.numeric.float.hexadecimal",
          "constant.numeric.float.octal",
          "constant.numeric.float.other",
          "constant.numeric.float",
          "constant.numeric.integer.binary",
          "constant.numeric.integer.decimal",
          "constant.numeric.integer.hexadecimal",
          "constant.numeric.integer.octal",
          "constant.numeric.integer.other",
          "constant.numeric.integer",
          "constant.numeric",
          "constant.other.placeholder",
          "constant.other",
          "constant",
          "entity.name.class.forward-decl",
          "entity.name.class",
          "entity.name.constant",
          "entity.name.enum",
          "entity.name.function.constructor",
          "entity.name.function.destructor",
          "entity.name.function",
          "entity.name.impl",
          "entity.name.interface",
          "entity.name.label",
          "entity.name.namespace",
          "entity.name.section",
          "entity.name.struct",
          "entity.name.tag",
          "entity.name.trait",
          "entity.name.type",
          "entity.name.union",
          "entity.name",
          "entity.other.attribute-name",
          "entity.other.inherited-class",
          "entity",
          "invalid.deprecated",
          "invalid.illegal",
          "invalid",
          "keyword.control.conditional",
          "keyword.control.import",
          "keyword.control",
          "keyword.declaration.class",
          "keyword.declaration.enum",
          "keyword.declaration.function",
          "keyword.declaration.impl",
          "keyword.declaration.interface",
          "keyword.declaration.struct",
          "keyword.declaration.trait",
          "keyword.declaration.type",
          "keyword.declaration.union",
          "keyword.declaration",
          "keyword.operator.arithmetic",
          "keyword.operator.assignment",
          "keyword.operator.bitwise",
          "keyword.operator.logical",
          "keyword.operator.word",
          "keyword.operator",
          "keyword.other",
          "keyword",
          "markup.bold",
          "markup.deleted",
          "markup.heading",
          "markup.inserted",
          "markup.italic",
          "markup.list.numbered",
          "markup.list.unnumbered",
          "markup.other",
          "markup.quote",
          "markup.raw.block",
          "markup.raw.inline",
          "markup.underline.link",
          "markup.underline",
          "markup",
          "meta.annotation.identifier",
          "meta.annotation.parameters",
          "meta.annotation",
          "meta.block",
          "meta.braces",
          "meta.brackets",
          "meta.class",
          "meta.enum",
          "meta.function-call",
          "meta.function.parameters",
          "meta.function.return-type",
          "meta.function",
          "meta.group",
          "meta.impl",
          "meta.interface",
          "meta.interpolation",
          "meta.namespace",
          "meta.paragraph",
          "meta.parens",
          "meta.path",
          "meta.preprocessor",
          "meta.string",
          "meta.struct",
          "meta.tag",
          "meta.toc-list",
          "meta.trait",
          "meta.type",
          "meta.union",
          "meta",
          "punctuation.accessor",
          "punctuation.definition.annotation",
          "punctuation.definition.comment",
          "punctuation.definition.keyword",
          "punctuation.definition.string.begin",
          "punctuation.definition.string.end",
          "punctuation.definition.variable",
          "punctuation.section.block.begin",
          "punctuation.section.block.end",
          "punctuation.section.braces.begin",
          "punctuation.section.braces.end",
          "punctuation.section.brackets.begin",
          "punctuation.section.brackets.end",
          "punctuation.section.group.begin",
          "punctuation.section.group.end",
          "punctuation.section.interpolation.begin",
          "punctuation.section.interpolation.end",
          "punctuation.section.parens.begin",
          "punctuation.section.parens.end",
          "punctuation.separator.continuation",
          "punctuation.separator",
          "punctuation.terminator",
          "source",
          "storage.modifier",
          "storage.type.class",
          "storage.type.enum",
          "storage.type.function",
          "storage.type.impl",
          "storage.type.interface",
          "storage.type.struct",
          "storage.type.trait",
          "storage.type.union",
          "storage.type",
          "storage.type",
          "string.quoted.double",
          "string.quoted.other",
          "string.quoted.single",
          "string.quoted.triple",
          "string.regexp",
          "string.unquoted",
          "string",
          "support.class",
          "support.constant",
          "support.function",
          "support.module",
          "support.type",
          "text.html",
          "text.xml",
          "text",
          "variable.annotation",
          "variable.function",
          "variable.language",
          "variable.other.constant",
          "variable.other.member",
          "variable.other.readwrite",
          "variable.other",
          "variable.parameter"
        )
        tokenModifiers = EmptyList ()
      ]
      range = null
      full = Either [
        left = true
        right = null
      ]
      documentSelector = null
      id = null
      workDoneProgress = null
    ]
    monikerProvider = null
    experimental = null
  ]
  serverInfo = null
]
2022-05-05 11:23:39,546 pool-2-thread-1 DEBUG Not in a ServletContext environment, thus not loading WebLookup plugin.
2022-05-05 11:23:39,548 pool-2-thread-1 DEBUG PluginManager 'Converter' found 45 plugins
2022-05-05 11:23:39,550 pool-2-thread-1 DEBUG Starting OutputStreamManager SYSTEM_OUT.false.false-2
2022-05-05 11:23:39,550 pool-2-thread-1 DEBUG Starting LoggerContext[name=Default, org.apache.logging.log4j.core.LoggerContext@33c98391]...
2022-05-05 11:23:39,550 Thread Context Data Task DEBUG Initializing Thread Context Data Service Providers
2022-05-05 11:23:39,551 pool-2-thread-1 DEBUG Reconfiguration started for context[name=Default] at URI null (org.apache.logging.log4j.core.LoggerContext@33c98391) with optional ClassLoader: null
2022-05-05 11:23:39,551 Thread Context Data Task DEBUG Thread Context Data Service Provider initialization complete
2022-05-05 11:23:39,551 pool-2-thread-1 DEBUG Using configurationFactory org.apache.logging.log4j.core.config.ConfigurationFactory$Factory@5866260f
2022-05-05 11:23:39,554 pool-2-thread-1 DEBUG Not in a ServletContext environment, thus not loading WebLookup plugin.
2022-05-05 11:23:39,554 pool-2-thread-1 DEBUG null 2.1.1-SNAPSHOT initializing configuration org.apache.logging.log4j.core.config.builder.impl.BuiltConfiguration@4b80968a
2022-05-05 11:23:39,555 pool-2-thread-1 DEBUG Installed 1 script engine
Warning: Nashorn engine is planned to be removed from a future JDK release
2022-05-05 11:23:39,591 pool-2-thread-1 DEBUG Oracle Nashorn version: 11.0.14.1, language: ECMAScript, threading: Not Thread Safe, compile: true, names: [nashorn, Nashorn, js, JS, JavaScript, javascript, ECMAScript, ecmascript], factory class: jdk.nashorn.api.scripting.NashornScriptEngineFactory
2022-05-05 11:23:39,592 pool-2-thread-1 DEBUG PluginManager 'Core' found 127 plugins
2022-05-05 11:23:39,592 pool-2-thread-1 DEBUG PluginManager 'Level' found 0 plugins
2022-05-05 11:23:39,592 pool-2-thread-1 DEBUG PluginManager 'Lookup' found 16 plugins
2022-05-05 11:23:39,593 pool-2-thread-1 DEBUG Building Plugin[name=AppenderRef, class=org.apache.logging.log4j.core.config.AppenderRef].
2022-05-05 11:23:39,593 pool-2-thread-1 DEBUG createAppenderRef(ref="Console", level="null", Filter=null)
2022-05-05 11:23:39,594 pool-2-thread-1 DEBUG Building Plugin[name=root, class=org.apache.logging.log4j.core.config.LoggerConfig$RootLogger].
2022-05-05 11:23:39,595 pool-2-thread-1 DEBUG createLogger(additivity="null", level="DEBUG", includeLocation="null", ={Console}, ={}, Configuration(DefaultLogger), Filter=null)
2022-05-05 11:23:39,595 pool-2-thread-1 DEBUG Building Plugin[name=loggers, class=org.apache.logging.log4j.core.config.LoggersPlugin].
2022-05-05 11:23:39,597 pool-2-thread-1 DEBUG createLoggers(={root})
2022-05-05 11:23:39,597 pool-2-thread-1 DEBUG Building Plugin[name=layout, class=org.apache.logging.log4j.core.layout.PatternLayout].
2022-05-05 11:23:39,598 pool-2-thread-1 DEBUG PatternLayout$Builder(pattern="%d [%t] %p - %c %m%n", PatternSelector=null, Configuration(DefaultLogger), Replace=null, charset="null", alwaysWriteExceptions="null", disableAnsi="null", noConsoleNoAnsi="null", header="null", footer="null")
2022-05-05 11:23:39,598 pool-2-thread-1 DEBUG PluginManager 'Converter' found 45 plugins
2022-05-05 11:23:39,599 pool-2-thread-1 DEBUG Building Plugin[name=appender, class=org.apache.logging.log4j.core.appender.ConsoleAppender].
2022-05-05 11:23:39,599 pool-2-thread-1 DEBUG ConsoleAppender$Builder(target="SYSTEM_ERR", follow="null", direct="null", bufferedIo="null", bufferSize="null", immediateFlush="null", ignoreExceptions="null", PatternLayout(%d [%t] %p - %c %m%n), name="Console", Configuration(DefaultLogger), Filter=null, ={})
2022-05-05 11:23:39,602 pool-2-thread-1 DEBUG Building Plugin[name=appenders, class=org.apache.logging.log4j.core.config.AppendersPlugin].
2022-05-05 11:23:39,603 pool-2-thread-1 DEBUG createAppenders(={Console})
2022-05-05 11:23:39,603 pool-2-thread-1 DEBUG Configuration org.apache.logging.log4j.core.config.builder.impl.BuiltConfiguration@4b80968a initialized
2022-05-05 11:23:39,604 pool-2-thread-1 DEBUG Starting configuration org.apache.logging.log4j.core.config.builder.impl.BuiltConfiguration@4b80968a
2022-05-05 11:23:39,604 pool-2-thread-1 DEBUG Started configuration org.apache.logging.log4j.core.config.builder.impl.BuiltConfiguration@4b80968a OK.
2022-05-05 11:23:39,604 pool-2-thread-1 DEBUG Shutting down OutputStreamManager SYSTEM_OUT.false.false-2
2022-05-05 11:23:39,605 pool-2-thread-1 DEBUG OutputStream closed
2022-05-05 11:23:39,605 pool-2-thread-1 DEBUG Shut down OutputStreamManager SYSTEM_OUT.false.false-2, all resources released: true
2022-05-05 11:23:39,606 pool-2-thread-1 DEBUG Appender DefaultConsole-2 stopped with status true
2022-05-05 11:23:39,606 pool-2-thread-1 DEBUG Stopped org.apache.logging.log4j.core.config.DefaultConfiguration@69c56dbb OK
2022-05-05 11:23:39,608 pool-2-thread-1 DEBUG Registering MBean org.apache.logging.log4j2:type=277050dc
2022-05-05 11:23:39,609 pool-2-thread-1 DEBUG Registering MBean org.apache.logging.log4j2:type=277050dc,component=StatusLogger
2022-05-05 11:23:39,609 pool-2-thread-1 DEBUG Registering MBean org.apache.logging.log4j2:type=277050dc,component=ContextSelector
2022-05-05 11:23:39,610 pool-2-thread-1 DEBUG Registering MBean org.apache.logging.log4j2:type=277050dc,component=Loggers,name=
2022-05-05 11:23:39,610 pool-2-thread-1 DEBUG Registering MBean org.apache.logging.log4j2:type=277050dc,component=Appenders,name=Console
2022-05-05 11:23:39,610 pool-2-thread-1 DEBUG Reconfiguration complete for context[name=Default] at URI NULL_SOURCE (org.apache.logging.log4j.core.LoggerContext@33c98391) with optional ClassLoader: null
2022-05-05 11:23:39,611 pool-2-thread-1 DEBUG Shutdown hook enabled. Registering a new one.
2022-05-05 11:23:39,611 pool-2-thread-1 DEBUG LoggerContext[name=Default, org.apache.logging.log4j.core.LoggerContext@33c98391] started OK.
2022-05-05 11:23:39,620 [pool-2-thread-1] INFO - Evaluator: evaluator for StateMachineLanguage Creating new progress bar: T3f9355e815752a3722 Loading evaluator for StateMachineLanguage []
2022-05-05 11:23:39,624 [pool-3-thread-1] INFO - Evaluator: evaluator for StateMachineLanguage Valid initialized progress bar: T3f9355e815752a3722
INFO: resolved |lib://typepal| at |jar+file:///Users/auke/.vscode/extensions/usethesource.rascalmpl-0.2.1/assets/jars/typepal.jar!/|
INFO: resolved |lib://rascal-core| at |jar+file:///Users/auke/.vscode/extensions/usethesource.rascalmpl-0.2.1/assets/jars/rascal-core.jar!/|
INFO: resolved |lib://rascal-lsp| at |jar+file:///Users/auke/.vscode/extensions/usethesource.rascalmpl-0.2.1/assets/jars/rascal-lsp.jar!/|
2022-05-05 11:23:44,449 [pool-2-thread-1] WARN - Evaluator: evaluator for StateMachineLanguage |project://my-app/src/CorelLanguageServer.rsc|(43,26,<4,0>,<4,26>) : Could not load RascalJavaBindings due to: Cannot link method com.mycompany.app.App because: class not found at |project://my-app/src/CorelLanguageServer.rsc|(43,26,<4,0>,<4,26>)
org.rascalmpl.exceptions.JavaMethodLink: Cannot link method com.mycompany.app.App because: class not found
	at org.rascalmpl.interpreter.utils.JavaBridge.getJavaClassInstance(JavaBridge.java:432)
	at org.rascalmpl.interpreter.result.JavaMethod.<init>(JavaMethod.java:95)
	at org.rascalmpl.interpreter.result.JavaMethod.<init>(JavaMethod.java:52)
	at org.rascalmpl.semantics.dynamic.FunctionDeclaration$Abstract.interpret(FunctionDeclaration.java:61)
	at org.rascalmpl.semantics.dynamic.Declaration$Function.interpret(Declaration.java:117)
	at org.rascalmpl.semantics.dynamic.Toplevel$GivenVisibility.interpret(Toplevel.java:35)
	at org.rascalmpl.semantics.dynamic.Module$Default.interpret(Module.java:79)
	at org.rascalmpl.semantics.dynamic.Import.loadModule(Import.java:319)
	at org.rascalmpl.semantics.dynamic.Import.importModule(Import.java:240)
	at org.rascalmpl.semantics.dynamic.Import$Default.interpret(Import.java:206)
	at org.rascalmpl.semantics.dynamic.Import.evalImport(Import.java:477)
	at org.rascalmpl.semantics.dynamic.Import.parseModuleAndFragments(Import.java:442)
	at org.rascalmpl.interpreter.Evaluator.parseModuleAndFragments(Evaluator.java:1416)
	at org.rascalmpl.interpreter.Evaluator.parseModuleAndFragments(Evaluator.java:1410)
	at org.rascalmpl.semantics.dynamic.Import.buildModule(Import.java:378)
	at org.rascalmpl.semantics.dynamic.Import.loadModule(Import.java:306)
	at org.rascalmpl.semantics.dynamic.Import.importModule(Import.java:240)
	at org.rascalmpl.interpreter.Evaluator.doImport(Evaluator.java:1144)
	at org.rascalmpl.vscode.lsp.util.EvaluatorUtil.lambda$makeFutureEvaluator$2(EvaluatorUtil.java:138)
	at java.base/java.util.concurrent.CompletableFuture$AsyncSupply.run(CompletableFuture.java:1700)
	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
	at java.base/java.lang.Thread.run(Thread.java:829)
2022-05-05 11:23:44,461 [pool-2-thread-1] WARN - Evaluator: evaluator for StateMachineLanguage |project://my-app/src/CorelLanguageServer.rsc|(43,26,<4,0>,<4,26>) : Could not import module RascalJavaBindings: Cannot link method com.mycompany.app.App because: class not found
Advice: |http://tutor.rascal-mpl.org/Errors/Static/ModuleImport/ModuleImport.html|
2022-05-05 11:23:57,078 [pool-2-thread-1] INFO - Evaluator: evaluator for StateMachineLanguage Finishing progress bar: T3f9355e815752a3722 - Loading evaluator for StateMachineLanguage
2022-05-05 11:23:57,079 [pool-2-thread-1] INFO - Evaluator: evaluator for StateMachineLanguage Finished progress bar: T3f9355e815752a3722 - Loading evaluator for StateMachineLanguage
2022-05-05 11:23:57,088 [pool-2-thread-2] INFO - Evaluator: evaluator for StateMachineLanguage Creating new progress bar: T11c6d441171f013809 StateMachineLanguage: StateMachineLanguage: loading contributions []
2022-05-05 11:23:57,089 [pool-3-thread-1] INFO - Evaluator: evaluator for StateMachineLanguage Valid initialized progress bar: T11c6d441171f013809
2022-05-05 11:23:57,096 [pool-2-thread-2] INFO - Evaluator: evaluator for StateMachineLanguage Finishing progress bar: T11c6d441171f013809 - StateMachineLanguage: StateMachineLanguage: loading contributions
2022-05-05 11:23:57,096 [pool-2-thread-2] INFO - Evaluator: evaluator for StateMachineLanguage Finished progress bar: T11c6d441171f013809 - StateMachineLanguage: StateMachineLanguage: loading contributions
