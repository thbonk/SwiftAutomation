//
//  SwiftAEGlueTemplate.swift
//  SwiftAutomation
//
//


let SwiftAEGlueTemplate = [
"//",
"//  «GLUE_NAME»",
"//  «APPLICATION_NAME» «APPLICATION_VERSION»",
"//  «FRAMEWORK_NAME» «FRAMEWORK_VERSION»",
"//  `«AEGLUE_COMMAND»`",
"//",
"",
"",
"import Foundation",
"«IMPORT_SWIFTAE»",
"",
"",
"/******************************************************************************/",
"// Untargeted AppData instance used in App, Con, Its roots; also used by Application constructors to create their own targeted AppData instances",
"",
"private let gUntargetedAppData = AppData(glueClasses: GlueClasses(insertionSpecifierType: «PREFIX»Insertion.self,",
"                                                                  objectSpecifierType: «PREFIX»Item.self,",
"                                                                  multiObjectSpecifierType: «PREFIX»Items.self,",
"                                                                  rootSpecifierType: «PREFIX»Root.self,",
"                                                                  applicationType: «APPLICATION_CLASS_NAME».self,",
"                                                                  symbolType: «PREFIX»Symbol.self,",
"                                                                  formatter: gSpecifierFormatter))",
"",
"",
"/******************************************************************************/",
"// Specifier formatter",
"",
"private let gSpecifierFormatter = SpecifierFormatter(applicationClassName: \"«APPLICATION_CLASS_NAME»\",",
"                                                     classNamePrefix: \"«PREFIX»\",",
"                                                     typeNames: [«+TYPE_FORMATTER»",
"                                                                     «CODE»: \"«NAME»\", // «CODE_STR»«-TYPE_FORMATTER»",
"                                                     ],",
"                                                     propertyNames: [«+PROPERTY_FORMATTER»",
"                                                                     «CODE»: \"«NAME»\", // «CODE_STR»«-PROPERTY_FORMATTER»",
"                                                     ],",
"                                                     elementsNames: [«+ELEMENTS_FORMATTER»",
"                                                                     «CODE»: \"«NAME»\", // «CODE_STR»«-ELEMENTS_FORMATTER»",
"                                                     ])",
"",
"",
"/******************************************************************************/",
"// Symbol subclass defines static type/enum/property constants based on «APPLICATION_NAME» terminology",
"",
"public class «PREFIX»Symbol: Symbol {",
"",
"    override public var typeAliasName: String {return \"«PREFIX»\"}",
"",
"    public override class func symbol(code: OSType, type: OSType = typeType, descriptor: NSAppleEventDescriptor? = nil) -> «PREFIX»Symbol {",
"        switch (code) {«+SYMBOL_SWITCH»",
"        case «CODE»: return self.«NAME» // «CODE_STR»«-SYMBOL_SWITCH»",
"        default: return super.symbol(code: code, type: type, descriptor: descriptor) as! «PREFIX»Symbol",
"        }",
"    }",
"",
"    // Types/properties«+TYPE_SYMBOL»",
"    public static let «NAME» = «PREFIX»Symbol(name: \"«NAME»\", code: «CODE», type: typeType) // «CODE_STR»«-TYPE_SYMBOL»",
"",
"    // Enumerators«+ENUM_SYMBOL»",
"    public static let «NAME» = «PREFIX»Symbol(name: \"«NAME»\", code: «CODE», type: typeEnumerated) // «CODE_STR»«-ENUM_SYMBOL»",
"}",
"",
"public typealias «PREFIX» = «PREFIX»Symbol // allows symbols to be written as (e.g.) «PREFIX».name instead of «PREFIX»Symbol.name",
"",
"",
"",
"/******************************************************************************/",
"// Specifier extensions; these add command methods and property/elements getters based on «APPLICATION_NAME» terminology",
"",
"public protocol «PREFIX»Command: SpecifierProtocol {} // provides AE dispatch methods",
"",
"// Command->Any will be bound when return type can't be inferred, else Command->T",
"",
"extension «PREFIX»Command {«+COMMAND»",
"    @discardableResult public func «COMMAND_NAME»(_ directParameter: Any = NoParameter,«+PARAMETER»",
"            «NAME»: Any = NoParameter,«-PARAMETER»",
"            resultType: Symbol? = nil, waitReply: Bool = true,",
"            withTimeout: TimeInterval? = nil, considering: ConsideringOptions? = nil) throws -> Any {",
"        return try self.appData.sendAppleEvent(name: \"«COMMAND_NAME»\", eventClass: «EVENT_CLASS», eventID: «EVENT_ID», // «EVENT_CLASS_STR»/«EVENT_ID_STR»",
"                parentSpecifier: (self as! Specifier), directParameter: directParameter, keywordParameters: [«+PARAMETER»",
"                    (\"«NAME»\", «CODE», «NAME»), // «CODE_STR»«-PARAMETER»",
"                ], requestedType: resultType, waitReply: waitReply, sendOptions: nil,",
"                withTimeout: withTimeout, considering: considering)",
"    }",
"    public func «COMMAND_NAME»<T>(_ directParameter: Any = NoParameter,«+PARAMETER»",
"            «NAME»: Any = NoParameter,«-PARAMETER»",
"            resultType: Symbol? = nil, waitReply: Bool = true,",
"            withTimeout: TimeInterval? = nil, considering: ConsideringOptions? = nil) throws -> T {",
"        return try self.appData.sendAppleEvent(name: \"«COMMAND_NAME»\", eventClass: «EVENT_CLASS», eventID: «EVENT_ID», // «EVENT_CLASS_STR»/«EVENT_ID_STR»",
"                parentSpecifier: (self as! Specifier), directParameter: directParameter, keywordParameters: [«+PARAMETER»",
"                    (\"«NAME»\", «CODE», «NAME»), // «CODE_STR»«-PARAMETER»",
"                ], requestedType: resultType, waitReply: waitReply, sendOptions: nil,",
"                withTimeout: withTimeout, considering: considering)",
"    }«-COMMAND»",
"}",
"",
"",
"public protocol «PREFIX»Object: ObjectSpecifierExtension, «PREFIX»Command {} // provides vars and methods for constructing specifiers",
"",
"extension «PREFIX»Object {",
"    ",
"    // Properties«+PROPERTY_SPECIFIER»",
"    public var «NAME»: «PREFIX»Item {return self.property(«CODE») as! «PREFIX»Item} // «CODE_STR»«-PROPERTY_SPECIFIER»",
"",
"    // Elements«+ELEMENTS_SPECIFIER»",
"    public var «NAME»: «PREFIX»Items {return self.elements(«CODE») as! «PREFIX»Items} // «CODE_STR»«-ELEMENTS_SPECIFIER»",
"}",
"",
"",
"/******************************************************************************/",
"// Specifier subclasses add app-specific extensions",
"",
"// beginning/end/before/after",
"public class «PREFIX»Insertion: InsertionSpecifier, «PREFIX»Command {}",
"",
"",
"// by index/name/id/previous/next",
"// first/middle/last/any",
"public class «PREFIX»Item: ObjectSpecifier, «PREFIX»Object {",
"    public typealias InsertionSpecifierType = «PREFIX»Insertion",
"    public typealias ObjectSpecifierType = «PREFIX»Item",
"    public typealias MultipleObjectSpecifierType = «PREFIX»Items",
"}",
"",
"// by range/test",
"// all",
"public class «PREFIX»Items: «PREFIX»Item, ElementsSpecifierExtension {}",
"",
"// App/Con/Its",
"public class «PREFIX»Root: RootSpecifier, «PREFIX»Object, RootSpecifierExtension {",
"    public typealias InsertionSpecifierType = «PREFIX»Insertion",
"    public typealias ObjectSpecifierType = «PREFIX»Item",
"    public typealias MultipleObjectSpecifierType = «PREFIX»Items",
"    public override class var untargetedAppData: AppData { return gUntargetedAppData }",
"}",
"",
"// application",
"public class «APPLICATION_CLASS_NAME»: «PREFIX»Root, ApplicationExtension {«+DEFAULT_INIT»",
"    public convenience init(launchOptions: LaunchOptions = DefaultLaunchOptions, relaunchMode: RelaunchMode = DefaultRelaunchMode) {",
"        self.init(rootObject: AppRootDesc, appData: type(of:self).untargetedAppData.targetedCopy(",
"                  .bundleIdentifier(\"«BUNDLE_IDENTIFIER»\", true), launchOptions: launchOptions, relaunchMode: relaunchMode))",
"    }",
"«-DEFAULT_INIT»}",
"",
"// App/Con/Its root objects used to construct untargeted specifiers; these can be used to construct specifiers for use in commands, though cannot send commands themselves",
"",
"public let «PREFIX»App = gUntargetedAppData.app as! «PREFIX»Root",
"public let «PREFIX»Con = gUntargetedAppData.con as! «PREFIX»Root",
"public let «PREFIX»Its = gUntargetedAppData.its as! «PREFIX»Root",
"",
"",
"/******************************************************************************/",
"// Static types",
"",
"typealias «PREFIX»Record = [«PREFIX»Symbol:Any] // default Swift type for AERecordDescs",
"",
"«+SUM_TYPE_DEFINITION»",
"public enum «SUM_TYPE_NAME» : SelfPacking, SelfUnpacking {«+CASE_DEFINITION»",
"    case «CASE_NAME»(«CASE_TYPE»)«-CASE_DEFINITION»",
"    «+INIT_DEFINITION»",
"    public init(_ value: «CASE_TYPE») { self = .«CASE_NAME»(value) }«-INIT_DEFINITION»",
"    ",
"    public func SwiftAutomation_packSelf(_ appData: AppData) throws -> NSAppleEventDescriptor {",
"        switch self {«+PACK_CASE»",
"        case .«CASE_NAME»(let value): return try appData.pack(value)«-PACK_CASE»",
"        }",
"    }",
"    public static func SwiftAutomation_unpackSelf(_ desc: NSAppleEventDescriptor, appData: AppData) throws -> «SUM_TYPE_NAME» {«+UNPACK_CASE»",
"        do { return .«CASE_NAME»(try appData.unpack(desc) as «CASE_TYPE») } catch {}«-UNPACK_CASE»",
"        throw UnpackError(appData: appData, descriptor: desc, type: «SUM_TYPE_NAME».self,",
"                          message: \"Can't coerce descriptor to Swift type: \\(«SUM_TYPE_NAME».self)\")",
"    }",
"}",
"«-SUM_TYPE_DEFINITION»",
"",
""].joined(separator: "\n")


