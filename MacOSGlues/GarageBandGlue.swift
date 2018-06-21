//
//  GarageBandGlue.swift
//  GarageBand.app 6.0.5
//  SwiftAutomation.framework 0.1.0
//  `aeglue -S 'GarageBand.app'`
//


import Foundation
import SwiftAutomation


/******************************************************************************/
// Create an untargeted AppData instance for use in App, Con, Its roots,
// and in Application initializers to create targeted AppData instances.

private let _specifierFormatter = SwiftAutomation.SpecifierFormatter(applicationClassName: "GarageBand",
                                                     classNamePrefix: "GBA",
                                                     typeNames: [
                                                                     0x616c6973: "alias", // "alis"
                                                                     0x2a2a2a2a: "anything", // "****"
                                                                     0x63617070: "application", // "capp"
                                                                     0x62756e64: "applicationBundleID", // "bund"
                                                                     0x7369676e: "applicationSignature", // "sign"
                                                                     0x6170726c: "applicationURL", // "aprl"
                                                                     0x61707220: "April", // "apr\0x20"
                                                                     0x61736b20: "ask", // "ask\0x20"
                                                                     0x61747473: "attachment", // "atts"
                                                                     0x63617472: "attributeRun", // "catr"
                                                                     0x61756720: "August", // "aug\0x20"
                                                                     0x62657374: "best", // "best"
                                                                     0x626d726b: "bookmarkData", // "bmrk"
                                                                     0x626f6f6c: "boolean", // "bool"
                                                                     0x71647274: "boundingRectangle", // "qdrt"
                                                                     0x70626e64: "bounds", // "pbnd"
                                                                     0x63617365: "case_", // "case"
                                                                     0x63686120: "character", // "cha\0x20"
                                                                     0x70636c73: "class_", // "pcls"
                                                                     0x68636c62: "closeable", // "hclb"
                                                                     0x6c77636c: "collating", // "lwcl"
                                                                     0x636f6c72: "color", // "colr"
                                                                     0x636c7274: "colorTable", // "clrt"
                                                                     0x656e756d: "constant", // "enum"
                                                                     0x6c776370: "copies", // "lwcp"
                                                                     0x44664350: "CPULoad", // "DfCP"
                                                                     0x44664379: "cycleMode", // "DfCy"
                                                                     0x74646173: "dashStyle", // "tdas"
                                                                     0x74647461: "data", // "tdta"
                                                                     0x6c647420: "date", // "ldt\0x20"
                                                                     0x64656320: "December", // "dec\0x20"
                                                                     0x6465636d: "decimalStruct", // "decm"
                                                                     0x6c776474: "detailed", // "lwdt"
                                                                     0x64696163: "diacriticals", // "diac"
                                                                     0x636f6d70: "doubleInteger", // "comp"
                                                                     0x656e6373: "encodedString", // "encs"
                                                                     0x6c776c70: "endingPage", // "lwlp"
                                                                     0x45505320: "EPSPicture", // "EPS\0x20"
                                                                     0x6c776568: "errorHandling", // "lweh"
                                                                     0x65787061: "expansion", // "expa"
                                                                     0x65787465: "extendedReal", // "exte"
                                                                     0x6661786e: "faxNumber", // "faxn"
                                                                     0x66656220: "February", // "feb\0x20"
                                                                     0x6174666e: "fileName", // "atfn"
                                                                     0x66737266: "fileRef", // "fsrf"
                                                                     0x66737320: "fileSpecification", // "fss\0x20"
                                                                     0x6675726c: "fileURL", // "furl"
                                                                     0x66697864: "fixed", // "fixd"
                                                                     0x66706e74: "fixedPoint", // "fpnt"
                                                                     0x66726374: "fixedRectangle", // "frct"
                                                                     0x6973666c: "floating", // "isfl"
                                                                     0x666f6e74: "font", // "font"
                                                                     0x66726920: "Friday", // "fri\0x20"
                                                                     0x70697366: "frontmost", // "pisf"
                                                                     0x47494666: "GIFPicture", // "GIFf"
                                                                     0x63677478: "graphicText", // "cgtx"
                                                                     0x68797068: "hyphens", // "hyph"
                                                                     0x49442020: "id", // "ID\0x20\0x20"
                                                                     0x70696478: "index", // "pidx"
                                                                     0x494e616d: "instrumentName", // "INam"
                                                                     0x6c6f6e67: "integer", // "long"
                                                                     0x69747874: "internationalText", // "itxt"
                                                                     0x696e746c: "internationalWritingCode", // "intl"
                                                                     0x636f626a: "item", // "cobj"
                                                                     0x6a616e20: "January", // "jan\0x20"
                                                                     0x4a504547: "JPEGPicture", // "JPEG"
                                                                     0x6a756c20: "July", // "jul\0x20"
                                                                     0x6a756e20: "June", // "jun\0x20"
                                                                     0x6b706964: "kernelProcessID", // "kpid"
                                                                     0x6c64626c: "largeReal", // "ldbl"
                                                                     0x6c697374: "list", // "list"
                                                                     0x696e736c: "locationReference", // "insl"
                                                                     0x5466727a: "locked", // "Tfrz"
                                                                     0x6c667864: "longFixed", // "lfxd"
                                                                     0x6c667074: "longFixedPoint", // "lfpt"
                                                                     0x6c667263: "longFixedRectangle", // "lfrc"
                                                                     0x6c706e74: "longPoint", // "lpnt"
                                                                     0x6c726374: "longRectangle", // "lrct"
                                                                     0x6d616368: "machine", // "mach"
                                                                     0x6d4c6f63: "machineLocation", // "mLoc"
                                                                     0x706f7274: "machPort", // "port"
                                                                     0x6d617220: "March", // "mar\0x20"
                                                                     0x44666d56: "masterVolume", // "DfmV"
                                                                     0x6d617920: "May", // "may\0x20"
                                                                     0x69736d6e: "miniaturizable", // "ismn"
                                                                     0x706d6e64: "miniaturized", // "pmnd"
                                                                     0x706d6f64: "modal", // "pmod"
                                                                     0x696d6f64: "modified", // "imod"
                                                                     0x6d6f6e20: "Monday", // "mon\0x20"
                                                                     0x544d7574: "muted", // "TMut"
                                                                     0x706e616d: "name", // "pnam"
                                                                     0x6e6f2020: "no", // "no\0x20\0x20"
                                                                     0x6e6f7620: "November", // "nov\0x20"
                                                                     0x6e756c6c: "null", // "null"
                                                                     0x6e756d65: "numericStrings", // "nume"
                                                                     0x6f637420: "October", // "oct\0x20"
                                                                     0x6c776c61: "pagesAcross", // "lwla"
                                                                     0x6c776c64: "pagesDown", // "lwld"
                                                                     0x5470616e: "pan", // "Tpan"
                                                                     0x63706172: "paragraph", // "cpar"
                                                                     0x70707468: "path", // "ppth"
                                                                     0x50494354: "PICTPicture", // "PICT"
                                                                     0x74706d6d: "pixelMapRecord", // "tpmm"
                                                                     0x51447074: "point", // "QDpt"
                                                                     0x70736574: "printSettings", // "pset"
                                                                     0x70736e20: "processSerialNumber", // "psn\0x20"
                                                                     0x70414c4c: "properties", // "pALL"
                                                                     0x70726f70: "property_", // "prop"
                                                                     0x70756e63: "punctuation", // "punc"
                                                                     0x646f7562: "real", // "doub"
                                                                     0x54617564: "realInstrument", // "Taud"
                                                                     0x7265636f: "record", // "reco"
                                                                     0x5452656e: "recordEnabled", // "TRen"
                                                                     0x6f626a20: "reference", // "obj\0x20"
                                                                     0x6c777174: "requestedPrintTime", // "lwqt"
                                                                     0x7072737a: "resizable", // "prsz"
                                                                     0x74723136: "RGB16Color", // "tr16"
                                                                     0x74723936: "RGB96Color", // "tr96"
                                                                     0x63524742: "RGBColor", // "cRGB"
                                                                     0x74726f74: "rotation", // "trot"
                                                                     0x73617420: "Saturday", // "sat\0x20"
                                                                     0x73637074: "script", // "scpt"
                                                                     0x54456e61: "selected", // "TEna"
                                                                     0x73657020: "September", // "sep\0x20"
                                                                     0x73686f72: "shortInteger", // "shor"
                                                                     0x7074737a: "size", // "ptsz"
                                                                     0x73696e67: "smallReal", // "sing"
                                                                     0x546d6964: "softwareInstrument", // "Tmid"
                                                                     0x54736f6c: "soloed", // "Tsol"
                                                                     0x646f6375: "song", // "docu"
                                                                     0x6c777374: "standard", // "lwst"
                                                                     0x6c776670: "startingPage", // "lwfp"
                                                                     0x54737465: "stereo", // "Tste"
                                                                     0x54455854: "string", // "TEXT"
                                                                     0x7374796c: "styledClipboardText", // "styl"
                                                                     0x53545854: "styledText", // "STXT"
                                                                     0x73756e20: "Sunday", // "sun\0x20"
                                                                     0x74727072: "targetPrinter", // "trpr"
                                                                     0x4466546d: "tempo", // "DfTm"
                                                                     0x63747874: "text", // "ctxt"
                                                                     0x74737479: "textStyleInfo", // "tsty"
                                                                     0x74687520: "Thursday", // "thu\0x20"
                                                                     0x54494646: "TIFFPicture", // "TIFF"
                                                                     0x70746974: "titled", // "ptit"
                                                                     0x54724b73: "track", // "TrKs"
                                                                     0x54766f6c: "trackVolume", // "Tvol"
                                                                     0x74756520: "Tuesday", // "tue\0x20"
                                                                     0x74797065: "typeClass", // "type"
                                                                     0x75747874: "UnicodeText", // "utxt"
                                                                     0x75636f6d: "unsignedDoubleInteger", // "ucom"
                                                                     0x6d61676e: "unsignedInteger", // "magn"
                                                                     0x75736872: "unsignedShortInteger", // "ushr"
                                                                     0x75743136: "UTF16Text", // "ut16"
                                                                     0x75746638: "UTF8Text", // "utf8"
                                                                     0x76657273: "version", // "vers"
                                                                     0x70766973: "visible", // "pvis"
                                                                     0x77656420: "Wednesday", // "wed\0x20"
                                                                     0x77686974: "whitespace", // "whit"
                                                                     0x6377696e: "window", // "cwin"
                                                                     0x63776f72: "word", // "cwor"
                                                                     0x70736374: "writingCode", // "psct"
                                                                     0x79657320: "yes", // "yes\0x20"
                                                                     0x69737a6d: "zoomable", // "iszm"
                                                                     0x707a756d: "zoomed", // "pzum"
                                                     ],
                                                     propertyNames: [
                                                                     0x70626e64: "bounds", // "pbnd"
                                                                     0x70636c73: "class_", // "pcls"
                                                                     0x68636c62: "closeable", // "hclb"
                                                                     0x6c77636c: "collating", // "lwcl"
                                                                     0x636f6c72: "color", // "colr"
                                                                     0x6c776370: "copies", // "lwcp"
                                                                     0x44664350: "CPULoad", // "DfCP"
                                                                     0x44664379: "cycleMode", // "DfCy"
                                                                     0x646f6375: "document", // "docu"
                                                                     0x6c776c70: "endingPage", // "lwlp"
                                                                     0x6c776568: "errorHandling", // "lweh"
                                                                     0x6661786e: "faxNumber", // "faxn"
                                                                     0x6174666e: "fileName", // "atfn"
                                                                     0x6973666c: "floating", // "isfl"
                                                                     0x666f6e74: "font", // "font"
                                                                     0x70697366: "frontmost", // "pisf"
                                                                     0x49442020: "id", // "ID\0x20\0x20"
                                                                     0x70696478: "index", // "pidx"
                                                                     0x494e616d: "instrumentName", // "INam"
                                                                     0x5466727a: "locked", // "Tfrz"
                                                                     0x44666d56: "masterVolume", // "DfmV"
                                                                     0x69736d6e: "miniaturizable", // "ismn"
                                                                     0x706d6e64: "miniaturized", // "pmnd"
                                                                     0x706d6f64: "modal", // "pmod"
                                                                     0x696d6f64: "modified", // "imod"
                                                                     0x544d7574: "muted", // "TMut"
                                                                     0x706e616d: "name", // "pnam"
                                                                     0x6c776c61: "pagesAcross", // "lwla"
                                                                     0x6c776c64: "pagesDown", // "lwld"
                                                                     0x5470616e: "pan", // "Tpan"
                                                                     0x70707468: "path", // "ppth"
                                                                     0x70414c4c: "properties", // "pALL"
                                                                     0x54617564: "realInstrument", // "Taud"
                                                                     0x5452656e: "recordEnabled", // "TRen"
                                                                     0x6c777174: "requestedPrintTime", // "lwqt"
                                                                     0x7072737a: "resizable", // "prsz"
                                                                     0x54456e61: "selected", // "TEna"
                                                                     0x7074737a: "size", // "ptsz"
                                                                     0x546d6964: "softwareInstrument", // "Tmid"
                                                                     0x54736f6c: "soloed", // "Tsol"
                                                                     0x6c776670: "startingPage", // "lwfp"
                                                                     0x54737465: "stereo", // "Tste"
                                                                     0x74727072: "targetPrinter", // "trpr"
                                                                     0x4466546d: "tempo", // "DfTm"
                                                                     0x70746974: "titled", // "ptit"
                                                                     0x54766f6c: "trackVolume", // "Tvol"
                                                                     0x76657273: "version", // "vers"
                                                                     0x70766973: "visible", // "pvis"
                                                                     0x69737a6d: "zoomable", // "iszm"
                                                                     0x707a756d: "zoomed", // "pzum"
                                                     ],
                                                     elementsNames: [
                                                                     0x63617070: "applications", // "capp"
                                                                     0x61747473: "attachments", // "atts"
                                                                     0x63617472: "attributeRuns", // "catr"
                                                                     0x63686120: "characters", // "cha\0x20"
                                                                     0x636f6c72: "colors", // "colr"
                                                                     0x636f626a: "items", // "cobj"
                                                                     0x63706172: "paragraphs", // "cpar"
                                                                     0x70736574: "printSettingss", // "pset"
                                                                     0x646f6375: "songs", // "docu"
                                                                     0x63747874: "texts", // "ctxt"
                                                                     0x54724b73: "tracks", // "TrKs"
                                                                     0x6377696e: "windows", // "cwin"
                                                                     0x63776f72: "words", // "cwor"
                                                     ])

private let _glueClasses = SwiftAutomation.GlueClasses(insertionSpecifierType: GBAInsertion.self,
                                       objectSpecifierType: GBAItem.self,
                                       multiObjectSpecifierType: GBAItems.self,
                                       rootSpecifierType: GBARoot.self,
                                       applicationType: GarageBand.self,
                                       symbolType: GBASymbol.self,
                                       formatter: _specifierFormatter)

private let _untargetedAppData = SwiftAutomation.AppData(glueClasses: _glueClasses)


/******************************************************************************/
// Symbol subclass defines static type/enum/property constants based on GarageBand.app terminology

public class GBASymbol: SwiftAutomation.Symbol {

    override public var typeAliasName: String {return "GBA"}

    public override class func symbol(code: OSType, type: OSType = typeType, descriptor: NSAppleEventDescriptor? = nil) -> GBASymbol {
        switch (code) {
        case 0x616c6973: return self.alias // "alis"
        case 0x2a2a2a2a: return self.anything // "****"
        case 0x63617070: return self.application // "capp"
        case 0x62756e64: return self.applicationBundleID // "bund"
        case 0x7369676e: return self.applicationSignature // "sign"
        case 0x6170726c: return self.applicationURL // "aprl"
        case 0x61707220: return self.April // "apr\0x20"
        case 0x61736b20: return self.ask // "ask\0x20"
        case 0x61747473: return self.attachment // "atts"
        case 0x63617472: return self.attributeRun // "catr"
        case 0x61756720: return self.August // "aug\0x20"
        case 0x62657374: return self.best // "best"
        case 0x626d726b: return self.bookmarkData // "bmrk"
        case 0x626f6f6c: return self.boolean // "bool"
        case 0x71647274: return self.boundingRectangle // "qdrt"
        case 0x70626e64: return self.bounds // "pbnd"
        case 0x63617365: return self.case_ // "case"
        case 0x63686120: return self.character // "cha\0x20"
        case 0x70636c73: return self.class_ // "pcls"
        case 0x68636c62: return self.closeable // "hclb"
        case 0x6c77636c: return self.collating // "lwcl"
        case 0x636f6c72: return self.color // "colr"
        case 0x636c7274: return self.colorTable // "clrt"
        case 0x656e756d: return self.constant // "enum"
        case 0x6c776370: return self.copies // "lwcp"
        case 0x44664350: return self.CPULoad // "DfCP"
        case 0x44664379: return self.cycleMode // "DfCy"
        case 0x74646173: return self.dashStyle // "tdas"
        case 0x74647461: return self.data // "tdta"
        case 0x6c647420: return self.date // "ldt\0x20"
        case 0x64656320: return self.December // "dec\0x20"
        case 0x6465636d: return self.decimalStruct // "decm"
        case 0x6c776474: return self.detailed // "lwdt"
        case 0x64696163: return self.diacriticals // "diac"
        case 0x636f6d70: return self.doubleInteger // "comp"
        case 0x656e6373: return self.encodedString // "encs"
        case 0x6c776c70: return self.endingPage // "lwlp"
        case 0x45505320: return self.EPSPicture // "EPS\0x20"
        case 0x6c776568: return self.errorHandling // "lweh"
        case 0x65787061: return self.expansion // "expa"
        case 0x65787465: return self.extendedReal // "exte"
        case 0x6661786e: return self.faxNumber // "faxn"
        case 0x66656220: return self.February // "feb\0x20"
        case 0x6174666e: return self.fileName // "atfn"
        case 0x66737266: return self.fileRef // "fsrf"
        case 0x66737320: return self.fileSpecification // "fss\0x20"
        case 0x6675726c: return self.fileURL // "furl"
        case 0x66697864: return self.fixed // "fixd"
        case 0x66706e74: return self.fixedPoint // "fpnt"
        case 0x66726374: return self.fixedRectangle // "frct"
        case 0x6973666c: return self.floating // "isfl"
        case 0x666f6e74: return self.font // "font"
        case 0x66726920: return self.Friday // "fri\0x20"
        case 0x70697366: return self.frontmost // "pisf"
        case 0x47494666: return self.GIFPicture // "GIFf"
        case 0x63677478: return self.graphicText // "cgtx"
        case 0x68797068: return self.hyphens // "hyph"
        case 0x49442020: return self.id // "ID\0x20\0x20"
        case 0x70696478: return self.index // "pidx"
        case 0x494e616d: return self.instrumentName // "INam"
        case 0x6c6f6e67: return self.integer // "long"
        case 0x69747874: return self.internationalText // "itxt"
        case 0x696e746c: return self.internationalWritingCode // "intl"
        case 0x636f626a: return self.item // "cobj"
        case 0x6a616e20: return self.January // "jan\0x20"
        case 0x4a504547: return self.JPEGPicture // "JPEG"
        case 0x6a756c20: return self.July // "jul\0x20"
        case 0x6a756e20: return self.June // "jun\0x20"
        case 0x6b706964: return self.kernelProcessID // "kpid"
        case 0x6c64626c: return self.largeReal // "ldbl"
        case 0x6c697374: return self.list // "list"
        case 0x696e736c: return self.locationReference // "insl"
        case 0x5466727a: return self.locked // "Tfrz"
        case 0x6c667864: return self.longFixed // "lfxd"
        case 0x6c667074: return self.longFixedPoint // "lfpt"
        case 0x6c667263: return self.longFixedRectangle // "lfrc"
        case 0x6c706e74: return self.longPoint // "lpnt"
        case 0x6c726374: return self.longRectangle // "lrct"
        case 0x6d616368: return self.machine // "mach"
        case 0x6d4c6f63: return self.machineLocation // "mLoc"
        case 0x706f7274: return self.machPort // "port"
        case 0x6d617220: return self.March // "mar\0x20"
        case 0x44666d56: return self.masterVolume // "DfmV"
        case 0x6d617920: return self.May // "may\0x20"
        case 0x69736d6e: return self.miniaturizable // "ismn"
        case 0x706d6e64: return self.miniaturized // "pmnd"
        case 0x706d6f64: return self.modal // "pmod"
        case 0x696d6f64: return self.modified // "imod"
        case 0x6d6f6e20: return self.Monday // "mon\0x20"
        case 0x544d7574: return self.muted // "TMut"
        case 0x706e616d: return self.name // "pnam"
        case 0x6e6f2020: return self.no // "no\0x20\0x20"
        case 0x6e6f7620: return self.November // "nov\0x20"
        case 0x6e756c6c: return self.null // "null"
        case 0x6e756d65: return self.numericStrings // "nume"
        case 0x6f637420: return self.October // "oct\0x20"
        case 0x6c776c61: return self.pagesAcross // "lwla"
        case 0x6c776c64: return self.pagesDown // "lwld"
        case 0x5470616e: return self.pan // "Tpan"
        case 0x63706172: return self.paragraph // "cpar"
        case 0x70707468: return self.path // "ppth"
        case 0x50494354: return self.PICTPicture // "PICT"
        case 0x74706d6d: return self.pixelMapRecord // "tpmm"
        case 0x51447074: return self.point // "QDpt"
        case 0x70736574: return self.printSettings // "pset"
        case 0x70736e20: return self.processSerialNumber // "psn\0x20"
        case 0x70414c4c: return self.properties // "pALL"
        case 0x70726f70: return self.property_ // "prop"
        case 0x70756e63: return self.punctuation // "punc"
        case 0x646f7562: return self.real // "doub"
        case 0x54617564: return self.realInstrument // "Taud"
        case 0x7265636f: return self.record // "reco"
        case 0x5452656e: return self.recordEnabled // "TRen"
        case 0x6f626a20: return self.reference // "obj\0x20"
        case 0x6c777174: return self.requestedPrintTime // "lwqt"
        case 0x7072737a: return self.resizable // "prsz"
        case 0x74723136: return self.RGB16Color // "tr16"
        case 0x74723936: return self.RGB96Color // "tr96"
        case 0x63524742: return self.RGBColor // "cRGB"
        case 0x74726f74: return self.rotation // "trot"
        case 0x73617420: return self.Saturday // "sat\0x20"
        case 0x73637074: return self.script // "scpt"
        case 0x54456e61: return self.selected // "TEna"
        case 0x73657020: return self.September // "sep\0x20"
        case 0x73686f72: return self.shortInteger // "shor"
        case 0x7074737a: return self.size // "ptsz"
        case 0x73696e67: return self.smallReal // "sing"
        case 0x546d6964: return self.softwareInstrument // "Tmid"
        case 0x54736f6c: return self.soloed // "Tsol"
        case 0x646f6375: return self.song // "docu"
        case 0x6c777374: return self.standard // "lwst"
        case 0x6c776670: return self.startingPage // "lwfp"
        case 0x54737465: return self.stereo // "Tste"
        case 0x54455854: return self.string // "TEXT"
        case 0x7374796c: return self.styledClipboardText // "styl"
        case 0x53545854: return self.styledText // "STXT"
        case 0x73756e20: return self.Sunday // "sun\0x20"
        case 0x74727072: return self.targetPrinter // "trpr"
        case 0x4466546d: return self.tempo // "DfTm"
        case 0x63747874: return self.text // "ctxt"
        case 0x74737479: return self.textStyleInfo // "tsty"
        case 0x74687520: return self.Thursday // "thu\0x20"
        case 0x54494646: return self.TIFFPicture // "TIFF"
        case 0x70746974: return self.titled // "ptit"
        case 0x54724b73: return self.track // "TrKs"
        case 0x54766f6c: return self.trackVolume // "Tvol"
        case 0x74756520: return self.Tuesday // "tue\0x20"
        case 0x74797065: return self.typeClass // "type"
        case 0x75747874: return self.UnicodeText // "utxt"
        case 0x75636f6d: return self.unsignedDoubleInteger // "ucom"
        case 0x6d61676e: return self.unsignedInteger // "magn"
        case 0x75736872: return self.unsignedShortInteger // "ushr"
        case 0x75743136: return self.UTF16Text // "ut16"
        case 0x75746638: return self.UTF8Text // "utf8"
        case 0x76657273: return self.version // "vers"
        case 0x70766973: return self.visible // "pvis"
        case 0x77656420: return self.Wednesday // "wed\0x20"
        case 0x77686974: return self.whitespace // "whit"
        case 0x6377696e: return self.window // "cwin"
        case 0x63776f72: return self.word // "cwor"
        case 0x70736374: return self.writingCode // "psct"
        case 0x79657320: return self.yes // "yes\0x20"
        case 0x69737a6d: return self.zoomable // "iszm"
        case 0x707a756d: return self.zoomed // "pzum"
        default: return super.symbol(code: code, type: type, descriptor: descriptor) as! GBASymbol
        }
    }

    // Types/properties
    public static let alias = GBASymbol(name: "alias", code: 0x616c6973, type: typeType) // "alis"
    public static let anything = GBASymbol(name: "anything", code: 0x2a2a2a2a, type: typeType) // "****"
    public static let application = GBASymbol(name: "application", code: 0x63617070, type: typeType) // "capp"
    public static let applicationBundleID = GBASymbol(name: "applicationBundleID", code: 0x62756e64, type: typeType) // "bund"
    public static let applicationSignature = GBASymbol(name: "applicationSignature", code: 0x7369676e, type: typeType) // "sign"
    public static let applicationURL = GBASymbol(name: "applicationURL", code: 0x6170726c, type: typeType) // "aprl"
    public static let April = GBASymbol(name: "April", code: 0x61707220, type: typeType) // "apr\0x20"
    public static let attachment = GBASymbol(name: "attachment", code: 0x61747473, type: typeType) // "atts"
    public static let attributeRun = GBASymbol(name: "attributeRun", code: 0x63617472, type: typeType) // "catr"
    public static let August = GBASymbol(name: "August", code: 0x61756720, type: typeType) // "aug\0x20"
    public static let best = GBASymbol(name: "best", code: 0x62657374, type: typeType) // "best"
    public static let bookmarkData = GBASymbol(name: "bookmarkData", code: 0x626d726b, type: typeType) // "bmrk"
    public static let boolean = GBASymbol(name: "boolean", code: 0x626f6f6c, type: typeType) // "bool"
    public static let boundingRectangle = GBASymbol(name: "boundingRectangle", code: 0x71647274, type: typeType) // "qdrt"
    public static let bounds = GBASymbol(name: "bounds", code: 0x70626e64, type: typeType) // "pbnd"
    public static let character = GBASymbol(name: "character", code: 0x63686120, type: typeType) // "cha\0x20"
    public static let class_ = GBASymbol(name: "class_", code: 0x70636c73, type: typeType) // "pcls"
    public static let closeable = GBASymbol(name: "closeable", code: 0x68636c62, type: typeType) // "hclb"
    public static let collating = GBASymbol(name: "collating", code: 0x6c77636c, type: typeType) // "lwcl"
    public static let color = GBASymbol(name: "color", code: 0x636f6c72, type: typeType) // "colr"
    public static let colorTable = GBASymbol(name: "colorTable", code: 0x636c7274, type: typeType) // "clrt"
    public static let constant = GBASymbol(name: "constant", code: 0x656e756d, type: typeType) // "enum"
    public static let copies = GBASymbol(name: "copies", code: 0x6c776370, type: typeType) // "lwcp"
    public static let CPULoad = GBASymbol(name: "CPULoad", code: 0x44664350, type: typeType) // "DfCP"
    public static let cycleMode = GBASymbol(name: "cycleMode", code: 0x44664379, type: typeType) // "DfCy"
    public static let dashStyle = GBASymbol(name: "dashStyle", code: 0x74646173, type: typeType) // "tdas"
    public static let data = GBASymbol(name: "data", code: 0x74647461, type: typeType) // "tdta"
    public static let date = GBASymbol(name: "date", code: 0x6c647420, type: typeType) // "ldt\0x20"
    public static let December = GBASymbol(name: "December", code: 0x64656320, type: typeType) // "dec\0x20"
    public static let decimalStruct = GBASymbol(name: "decimalStruct", code: 0x6465636d, type: typeType) // "decm"
    public static let document = GBASymbol(name: "document", code: 0x646f6375, type: typeType) // "docu"
    public static let doubleInteger = GBASymbol(name: "doubleInteger", code: 0x636f6d70, type: typeType) // "comp"
    public static let encodedString = GBASymbol(name: "encodedString", code: 0x656e6373, type: typeType) // "encs"
    public static let endingPage = GBASymbol(name: "endingPage", code: 0x6c776c70, type: typeType) // "lwlp"
    public static let EPSPicture = GBASymbol(name: "EPSPicture", code: 0x45505320, type: typeType) // "EPS\0x20"
    public static let errorHandling = GBASymbol(name: "errorHandling", code: 0x6c776568, type: typeType) // "lweh"
    public static let extendedReal = GBASymbol(name: "extendedReal", code: 0x65787465, type: typeType) // "exte"
    public static let faxNumber = GBASymbol(name: "faxNumber", code: 0x6661786e, type: typeType) // "faxn"
    public static let February = GBASymbol(name: "February", code: 0x66656220, type: typeType) // "feb\0x20"
    public static let fileName = GBASymbol(name: "fileName", code: 0x6174666e, type: typeType) // "atfn"
    public static let fileRef = GBASymbol(name: "fileRef", code: 0x66737266, type: typeType) // "fsrf"
    public static let fileSpecification = GBASymbol(name: "fileSpecification", code: 0x66737320, type: typeType) // "fss\0x20"
    public static let fileURL = GBASymbol(name: "fileURL", code: 0x6675726c, type: typeType) // "furl"
    public static let fixed = GBASymbol(name: "fixed", code: 0x66697864, type: typeType) // "fixd"
    public static let fixedPoint = GBASymbol(name: "fixedPoint", code: 0x66706e74, type: typeType) // "fpnt"
    public static let fixedRectangle = GBASymbol(name: "fixedRectangle", code: 0x66726374, type: typeType) // "frct"
    public static let floating = GBASymbol(name: "floating", code: 0x6973666c, type: typeType) // "isfl"
    public static let font = GBASymbol(name: "font", code: 0x666f6e74, type: typeType) // "font"
    public static let Friday = GBASymbol(name: "Friday", code: 0x66726920, type: typeType) // "fri\0x20"
    public static let frontmost = GBASymbol(name: "frontmost", code: 0x70697366, type: typeType) // "pisf"
    public static let GIFPicture = GBASymbol(name: "GIFPicture", code: 0x47494666, type: typeType) // "GIFf"
    public static let graphicText = GBASymbol(name: "graphicText", code: 0x63677478, type: typeType) // "cgtx"
    public static let id = GBASymbol(name: "id", code: 0x49442020, type: typeType) // "ID\0x20\0x20"
    public static let index = GBASymbol(name: "index", code: 0x70696478, type: typeType) // "pidx"
    public static let instrumentName = GBASymbol(name: "instrumentName", code: 0x494e616d, type: typeType) // "INam"
    public static let integer = GBASymbol(name: "integer", code: 0x6c6f6e67, type: typeType) // "long"
    public static let internationalText = GBASymbol(name: "internationalText", code: 0x69747874, type: typeType) // "itxt"
    public static let internationalWritingCode = GBASymbol(name: "internationalWritingCode", code: 0x696e746c, type: typeType) // "intl"
    public static let item = GBASymbol(name: "item", code: 0x636f626a, type: typeType) // "cobj"
    public static let January = GBASymbol(name: "January", code: 0x6a616e20, type: typeType) // "jan\0x20"
    public static let JPEGPicture = GBASymbol(name: "JPEGPicture", code: 0x4a504547, type: typeType) // "JPEG"
    public static let July = GBASymbol(name: "July", code: 0x6a756c20, type: typeType) // "jul\0x20"
    public static let June = GBASymbol(name: "June", code: 0x6a756e20, type: typeType) // "jun\0x20"
    public static let kernelProcessID = GBASymbol(name: "kernelProcessID", code: 0x6b706964, type: typeType) // "kpid"
    public static let largeReal = GBASymbol(name: "largeReal", code: 0x6c64626c, type: typeType) // "ldbl"
    public static let list = GBASymbol(name: "list", code: 0x6c697374, type: typeType) // "list"
    public static let locationReference = GBASymbol(name: "locationReference", code: 0x696e736c, type: typeType) // "insl"
    public static let locked = GBASymbol(name: "locked", code: 0x5466727a, type: typeType) // "Tfrz"
    public static let longFixed = GBASymbol(name: "longFixed", code: 0x6c667864, type: typeType) // "lfxd"
    public static let longFixedPoint = GBASymbol(name: "longFixedPoint", code: 0x6c667074, type: typeType) // "lfpt"
    public static let longFixedRectangle = GBASymbol(name: "longFixedRectangle", code: 0x6c667263, type: typeType) // "lfrc"
    public static let longPoint = GBASymbol(name: "longPoint", code: 0x6c706e74, type: typeType) // "lpnt"
    public static let longRectangle = GBASymbol(name: "longRectangle", code: 0x6c726374, type: typeType) // "lrct"
    public static let machine = GBASymbol(name: "machine", code: 0x6d616368, type: typeType) // "mach"
    public static let machineLocation = GBASymbol(name: "machineLocation", code: 0x6d4c6f63, type: typeType) // "mLoc"
    public static let machPort = GBASymbol(name: "machPort", code: 0x706f7274, type: typeType) // "port"
    public static let March = GBASymbol(name: "March", code: 0x6d617220, type: typeType) // "mar\0x20"
    public static let masterVolume = GBASymbol(name: "masterVolume", code: 0x44666d56, type: typeType) // "DfmV"
    public static let May = GBASymbol(name: "May", code: 0x6d617920, type: typeType) // "may\0x20"
    public static let miniaturizable = GBASymbol(name: "miniaturizable", code: 0x69736d6e, type: typeType) // "ismn"
    public static let miniaturized = GBASymbol(name: "miniaturized", code: 0x706d6e64, type: typeType) // "pmnd"
    public static let modal = GBASymbol(name: "modal", code: 0x706d6f64, type: typeType) // "pmod"
    public static let modified = GBASymbol(name: "modified", code: 0x696d6f64, type: typeType) // "imod"
    public static let Monday = GBASymbol(name: "Monday", code: 0x6d6f6e20, type: typeType) // "mon\0x20"
    public static let muted = GBASymbol(name: "muted", code: 0x544d7574, type: typeType) // "TMut"
    public static let name = GBASymbol(name: "name", code: 0x706e616d, type: typeType) // "pnam"
    public static let November = GBASymbol(name: "November", code: 0x6e6f7620, type: typeType) // "nov\0x20"
    public static let null = GBASymbol(name: "null", code: 0x6e756c6c, type: typeType) // "null"
    public static let October = GBASymbol(name: "October", code: 0x6f637420, type: typeType) // "oct\0x20"
    public static let pagesAcross = GBASymbol(name: "pagesAcross", code: 0x6c776c61, type: typeType) // "lwla"
    public static let pagesDown = GBASymbol(name: "pagesDown", code: 0x6c776c64, type: typeType) // "lwld"
    public static let pan = GBASymbol(name: "pan", code: 0x5470616e, type: typeType) // "Tpan"
    public static let paragraph = GBASymbol(name: "paragraph", code: 0x63706172, type: typeType) // "cpar"
    public static let path = GBASymbol(name: "path", code: 0x70707468, type: typeType) // "ppth"
    public static let PICTPicture = GBASymbol(name: "PICTPicture", code: 0x50494354, type: typeType) // "PICT"
    public static let pixelMapRecord = GBASymbol(name: "pixelMapRecord", code: 0x74706d6d, type: typeType) // "tpmm"
    public static let point = GBASymbol(name: "point", code: 0x51447074, type: typeType) // "QDpt"
    public static let printSettings = GBASymbol(name: "printSettings", code: 0x70736574, type: typeType) // "pset"
    public static let processSerialNumber = GBASymbol(name: "processSerialNumber", code: 0x70736e20, type: typeType) // "psn\0x20"
    public static let properties = GBASymbol(name: "properties", code: 0x70414c4c, type: typeType) // "pALL"
    public static let property_ = GBASymbol(name: "property_", code: 0x70726f70, type: typeType) // "prop"
    public static let real = GBASymbol(name: "real", code: 0x646f7562, type: typeType) // "doub"
    public static let realInstrument = GBASymbol(name: "realInstrument", code: 0x54617564, type: typeType) // "Taud"
    public static let record = GBASymbol(name: "record", code: 0x7265636f, type: typeType) // "reco"
    public static let recordEnabled = GBASymbol(name: "recordEnabled", code: 0x5452656e, type: typeType) // "TRen"
    public static let reference = GBASymbol(name: "reference", code: 0x6f626a20, type: typeType) // "obj\0x20"
    public static let requestedPrintTime = GBASymbol(name: "requestedPrintTime", code: 0x6c777174, type: typeType) // "lwqt"
    public static let resizable = GBASymbol(name: "resizable", code: 0x7072737a, type: typeType) // "prsz"
    public static let RGB16Color = GBASymbol(name: "RGB16Color", code: 0x74723136, type: typeType) // "tr16"
    public static let RGB96Color = GBASymbol(name: "RGB96Color", code: 0x74723936, type: typeType) // "tr96"
    public static let RGBColor = GBASymbol(name: "RGBColor", code: 0x63524742, type: typeType) // "cRGB"
    public static let rotation = GBASymbol(name: "rotation", code: 0x74726f74, type: typeType) // "trot"
    public static let Saturday = GBASymbol(name: "Saturday", code: 0x73617420, type: typeType) // "sat\0x20"
    public static let script = GBASymbol(name: "script", code: 0x73637074, type: typeType) // "scpt"
    public static let selected = GBASymbol(name: "selected", code: 0x54456e61, type: typeType) // "TEna"
    public static let September = GBASymbol(name: "September", code: 0x73657020, type: typeType) // "sep\0x20"
    public static let shortInteger = GBASymbol(name: "shortInteger", code: 0x73686f72, type: typeType) // "shor"
    public static let size = GBASymbol(name: "size", code: 0x7074737a, type: typeType) // "ptsz"
    public static let smallReal = GBASymbol(name: "smallReal", code: 0x73696e67, type: typeType) // "sing"
    public static let softwareInstrument = GBASymbol(name: "softwareInstrument", code: 0x546d6964, type: typeType) // "Tmid"
    public static let soloed = GBASymbol(name: "soloed", code: 0x54736f6c, type: typeType) // "Tsol"
    public static let song = GBASymbol(name: "song", code: 0x646f6375, type: typeType) // "docu"
    public static let startingPage = GBASymbol(name: "startingPage", code: 0x6c776670, type: typeType) // "lwfp"
    public static let stereo = GBASymbol(name: "stereo", code: 0x54737465, type: typeType) // "Tste"
    public static let string = GBASymbol(name: "string", code: 0x54455854, type: typeType) // "TEXT"
    public static let styledClipboardText = GBASymbol(name: "styledClipboardText", code: 0x7374796c, type: typeType) // "styl"
    public static let styledText = GBASymbol(name: "styledText", code: 0x53545854, type: typeType) // "STXT"
    public static let Sunday = GBASymbol(name: "Sunday", code: 0x73756e20, type: typeType) // "sun\0x20"
    public static let targetPrinter = GBASymbol(name: "targetPrinter", code: 0x74727072, type: typeType) // "trpr"
    public static let tempo = GBASymbol(name: "tempo", code: 0x4466546d, type: typeType) // "DfTm"
    public static let text = GBASymbol(name: "text", code: 0x63747874, type: typeType) // "ctxt"
    public static let textStyleInfo = GBASymbol(name: "textStyleInfo", code: 0x74737479, type: typeType) // "tsty"
    public static let Thursday = GBASymbol(name: "Thursday", code: 0x74687520, type: typeType) // "thu\0x20"
    public static let TIFFPicture = GBASymbol(name: "TIFFPicture", code: 0x54494646, type: typeType) // "TIFF"
    public static let titled = GBASymbol(name: "titled", code: 0x70746974, type: typeType) // "ptit"
    public static let track = GBASymbol(name: "track", code: 0x54724b73, type: typeType) // "TrKs"
    public static let trackVolume = GBASymbol(name: "trackVolume", code: 0x54766f6c, type: typeType) // "Tvol"
    public static let Tuesday = GBASymbol(name: "Tuesday", code: 0x74756520, type: typeType) // "tue\0x20"
    public static let typeClass = GBASymbol(name: "typeClass", code: 0x74797065, type: typeType) // "type"
    public static let UnicodeText = GBASymbol(name: "UnicodeText", code: 0x75747874, type: typeType) // "utxt"
    public static let unsignedDoubleInteger = GBASymbol(name: "unsignedDoubleInteger", code: 0x75636f6d, type: typeType) // "ucom"
    public static let unsignedInteger = GBASymbol(name: "unsignedInteger", code: 0x6d61676e, type: typeType) // "magn"
    public static let unsignedShortInteger = GBASymbol(name: "unsignedShortInteger", code: 0x75736872, type: typeType) // "ushr"
    public static let UTF16Text = GBASymbol(name: "UTF16Text", code: 0x75743136, type: typeType) // "ut16"
    public static let UTF8Text = GBASymbol(name: "UTF8Text", code: 0x75746638, type: typeType) // "utf8"
    public static let version = GBASymbol(name: "version", code: 0x76657273, type: typeType) // "vers"
    public static let visible = GBASymbol(name: "visible", code: 0x70766973, type: typeType) // "pvis"
    public static let Wednesday = GBASymbol(name: "Wednesday", code: 0x77656420, type: typeType) // "wed\0x20"
    public static let window = GBASymbol(name: "window", code: 0x6377696e, type: typeType) // "cwin"
    public static let word = GBASymbol(name: "word", code: 0x63776f72, type: typeType) // "cwor"
    public static let writingCode = GBASymbol(name: "writingCode", code: 0x70736374, type: typeType) // "psct"
    public static let zoomable = GBASymbol(name: "zoomable", code: 0x69737a6d, type: typeType) // "iszm"
    public static let zoomed = GBASymbol(name: "zoomed", code: 0x707a756d, type: typeType) // "pzum"

    // Enumerators
    public static let ask = GBASymbol(name: "ask", code: 0x61736b20, type: typeEnumerated) // "ask\0x20"
    public static let case_ = GBASymbol(name: "case_", code: 0x63617365, type: typeEnumerated) // "case"
    public static let detailed = GBASymbol(name: "detailed", code: 0x6c776474, type: typeEnumerated) // "lwdt"
    public static let diacriticals = GBASymbol(name: "diacriticals", code: 0x64696163, type: typeEnumerated) // "diac"
    public static let expansion = GBASymbol(name: "expansion", code: 0x65787061, type: typeEnumerated) // "expa"
    public static let hyphens = GBASymbol(name: "hyphens", code: 0x68797068, type: typeEnumerated) // "hyph"
    public static let no = GBASymbol(name: "no", code: 0x6e6f2020, type: typeEnumerated) // "no\0x20\0x20"
    public static let numericStrings = GBASymbol(name: "numericStrings", code: 0x6e756d65, type: typeEnumerated) // "nume"
    public static let punctuation = GBASymbol(name: "punctuation", code: 0x70756e63, type: typeEnumerated) // "punc"
    public static let standard = GBASymbol(name: "standard", code: 0x6c777374, type: typeEnumerated) // "lwst"
    public static let whitespace = GBASymbol(name: "whitespace", code: 0x77686974, type: typeEnumerated) // "whit"
    public static let yes = GBASymbol(name: "yes", code: 0x79657320, type: typeEnumerated) // "yes\0x20"
}

public typealias GBA = GBASymbol // allows symbols to be written as (e.g.) GBA.name instead of GBASymbol.name


/******************************************************************************/
// Specifier extensions; these add command methods and property/elements getters based on GarageBand.app terminology

public protocol GBACommand: SwiftAutomation.SpecifierProtocol {} // provides AE dispatch methods

// Command->Any will be bound when return type can't be inferred, else Command->T

extension GBACommand {
    @discardableResult public func activate(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "activate", eventClass: 0x6d697363, eventID: 0x61637476, // "misc"/"actv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func activate<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "activate", eventClass: 0x6d697363, eventID: 0x61637476, // "misc"/"actv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func addmovie(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "addmovie", eventClass: 0x62616e64, eventID: 0x6d6f7669, // "band"/"movi"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func addmovie<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "addmovie", eventClass: 0x62616e64, eventID: 0x6d6f7669, // "band"/"movi"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func close(_ directParameter: Any = SwiftAutomation.NoParameter,
            saving: Any = SwiftAutomation.NoParameter,
            savingIn: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "close", eventClass: 0x636f7265, eventID: 0x636c6f73, // "core"/"clos"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("saving", 0x7361766f, saving), // "savo"
                    ("savingIn", 0x6b66696c, savingIn), // "kfil"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func close<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            saving: Any = SwiftAutomation.NoParameter,
            savingIn: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "close", eventClass: 0x636f7265, eventID: 0x636c6f73, // "core"/"clos"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("saving", 0x7361766f, saving), // "savo"
                    ("savingIn", 0x6b66696c, savingIn), // "kfil"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func count(_ directParameter: Any = SwiftAutomation.NoParameter,
            each: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "count", eventClass: 0x636f7265, eventID: 0x636e7465, // "core"/"cnte"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("each", 0x6b6f636c, each), // "kocl"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func count<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            each: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "count", eventClass: 0x636f7265, eventID: 0x636e7465, // "core"/"cnte"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("each", 0x6b6f636c, each), // "kocl"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func delete(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "delete", eventClass: 0x636f7265, eventID: 0x64656c6f, // "core"/"delo"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func delete<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "delete", eventClass: 0x636f7265, eventID: 0x64656c6f, // "core"/"delo"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func duplicate(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "duplicate", eventClass: 0x636f7265, eventID: 0x636c6f6e, // "core"/"clon"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func duplicate<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "duplicate", eventClass: 0x636f7265, eventID: 0x636c6f6e, // "core"/"clon"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func exists(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "exists", eventClass: 0x636f7265, eventID: 0x646f6578, // "core"/"doex"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func exists<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "exists", eventClass: 0x636f7265, eventID: 0x646f6578, // "core"/"doex"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func forward(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "forward", eventClass: 0x62616e64, eventID: 0x666f7277, // "band"/"forw"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func forward<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "forward", eventClass: 0x62616e64, eventID: 0x666f7277, // "band"/"forw"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func get(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "get", eventClass: 0x636f7265, eventID: 0x67657464, // "core"/"getd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func get<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "get", eventClass: 0x636f7265, eventID: 0x67657464, // "core"/"getd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func make(_ directParameter: Any = SwiftAutomation.NoParameter,
            new: Any = SwiftAutomation.NoParameter,
            at: Any = SwiftAutomation.NoParameter,
            withData: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "make", eventClass: 0x636f7265, eventID: 0x6372656c, // "core"/"crel"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("new", 0x6b6f636c, new), // "kocl"
                    ("at", 0x696e7368, at), // "insh"
                    ("withData", 0x64617461, withData), // "data"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func make<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            new: Any = SwiftAutomation.NoParameter,
            at: Any = SwiftAutomation.NoParameter,
            withData: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "make", eventClass: 0x636f7265, eventID: 0x6372656c, // "core"/"crel"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("new", 0x6b6f636c, new), // "kocl"
                    ("at", 0x696e7368, at), // "insh"
                    ("withData", 0x64617461, withData), // "data"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func move(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "move", eventClass: 0x636f7265, eventID: 0x6d6f7665, // "core"/"move"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func move<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "move", eventClass: 0x636f7265, eventID: 0x6d6f7665, // "core"/"move"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func open(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "open", eventClass: 0x61657674, eventID: 0x6f646f63, // "aevt"/"odoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func open<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "open", eventClass: 0x61657674, eventID: 0x6f646f63, // "aevt"/"odoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func openLocation(_ directParameter: Any = SwiftAutomation.NoParameter,
            window: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "openLocation", eventClass: 0x4755524c, eventID: 0x4755524c, // "GURL"/"GURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("window", 0x57494e44, window), // "WIND"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func openLocation<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            window: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "openLocation", eventClass: 0x4755524c, eventID: 0x4755524c, // "GURL"/"GURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("window", 0x57494e44, window), // "WIND"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func play(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "play", eventClass: 0x62616e64, eventID: 0x706c6179, // "band"/"play"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func play<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "play", eventClass: 0x62616e64, eventID: 0x706c6179, // "band"/"play"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func print(_ directParameter: Any = SwiftAutomation.NoParameter,
            printDialog: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "print", eventClass: 0x61657674, eventID: 0x70646f63, // "aevt"/"pdoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("printDialog", 0x70646c67, printDialog), // "pdlg"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func print<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            printDialog: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "print", eventClass: 0x61657674, eventID: 0x70646f63, // "aevt"/"pdoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("printDialog", 0x70646c67, printDialog), // "pdlg"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func quit(_ directParameter: Any = SwiftAutomation.NoParameter,
            saving: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "quit", eventClass: 0x61657674, eventID: 0x71756974, // "aevt"/"quit"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("saving", 0x7361766f, saving), // "savo"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func quit<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            saving: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "quit", eventClass: 0x61657674, eventID: 0x71756974, // "aevt"/"quit"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("saving", 0x7361766f, saving), // "savo"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func renderPreview(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "renderPreview", eventClass: 0x62616e64, eventID: 0x70726576, // "band"/"prev"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func renderPreview<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "renderPreview", eventClass: 0x62616e64, eventID: 0x70726576, // "band"/"prev"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func reopen(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "reopen", eventClass: 0x61657674, eventID: 0x72617070, // "aevt"/"rapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func reopen<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "reopen", eventClass: 0x61657674, eventID: 0x72617070, // "aevt"/"rapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func resetPeakLEDs(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "resetPeakLEDs", eventClass: 0x62616e64, eventID: 0x4c454473, // "band"/"LEDs"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func resetPeakLEDs<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "resetPeakLEDs", eventClass: 0x62616e64, eventID: 0x4c454473, // "band"/"LEDs"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func rewind(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "rewind", eventClass: 0x62616e64, eventID: 0x72657769, // "band"/"rewi"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func rewind<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "rewind", eventClass: 0x62616e64, eventID: 0x72657769, // "band"/"rewi"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func run(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "run", eventClass: 0x61657674, eventID: 0x6f617070, // "aevt"/"oapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func run<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "run", eventClass: 0x61657674, eventID: 0x6f617070, // "aevt"/"oapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func save(_ directParameter: Any = SwiftAutomation.NoParameter,
            as_: Any = SwiftAutomation.NoParameter,
            in_: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "save", eventClass: 0x636f7265, eventID: 0x73617665, // "core"/"save"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("as_", 0x666c7470, as_), // "fltp"
                    ("in_", 0x6b66696c, in_), // "kfil"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func save<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            as_: Any = SwiftAutomation.NoParameter,
            in_: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "save", eventClass: 0x636f7265, eventID: 0x73617665, // "core"/"save"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("as_", 0x666c7470, as_), // "fltp"
                    ("in_", 0x6b66696c, in_), // "kfil"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func set(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "set", eventClass: 0x636f7265, eventID: 0x73657464, // "core"/"setd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x64617461, to), // "data"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func set<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "set", eventClass: 0x636f7265, eventID: 0x73657464, // "core"/"setd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x64617461, to), // "data"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func start(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "start", eventClass: 0x62616e64, eventID: 0x73746172, // "band"/"star"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func start<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "start", eventClass: 0x62616e64, eventID: 0x73746172, // "band"/"star"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func stop(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "stop", eventClass: 0x62616e64, eventID: 0x70617573, // "band"/"paus"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func stop<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "stop", eventClass: 0x62616e64, eventID: 0x70617573, // "band"/"paus"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
}


public protocol GBAObject: SwiftAutomation.ObjectSpecifierExtension, GBACommand {} // provides vars and methods for constructing specifiers

extension GBAObject {
    
    // Properties
    public var bounds: GBAItem {return self.property(0x70626e64) as! GBAItem} // "pbnd"
    public var class_: GBAItem {return self.property(0x70636c73) as! GBAItem} // "pcls"
    public var closeable: GBAItem {return self.property(0x68636c62) as! GBAItem} // "hclb"
    public var collating: GBAItem {return self.property(0x6c77636c) as! GBAItem} // "lwcl"
    public var color: GBAItem {return self.property(0x636f6c72) as! GBAItem} // "colr"
    public var copies: GBAItem {return self.property(0x6c776370) as! GBAItem} // "lwcp"
    public var CPULoad: GBAItem {return self.property(0x44664350) as! GBAItem} // "DfCP"
    public var cycleMode: GBAItem {return self.property(0x44664379) as! GBAItem} // "DfCy"
    public var document: GBAItem {return self.property(0x646f6375) as! GBAItem} // "docu"
    public var endingPage: GBAItem {return self.property(0x6c776c70) as! GBAItem} // "lwlp"
    public var errorHandling: GBAItem {return self.property(0x6c776568) as! GBAItem} // "lweh"
    public var faxNumber: GBAItem {return self.property(0x6661786e) as! GBAItem} // "faxn"
    public var fileName: GBAItem {return self.property(0x6174666e) as! GBAItem} // "atfn"
    public var floating: GBAItem {return self.property(0x6973666c) as! GBAItem} // "isfl"
    public var font: GBAItem {return self.property(0x666f6e74) as! GBAItem} // "font"
    public var frontmost: GBAItem {return self.property(0x70697366) as! GBAItem} // "pisf"
    public var id: GBAItem {return self.property(0x49442020) as! GBAItem} // "ID\0x20\0x20"
    public var index: GBAItem {return self.property(0x70696478) as! GBAItem} // "pidx"
    public var instrumentName: GBAItem {return self.property(0x494e616d) as! GBAItem} // "INam"
    public var locked: GBAItem {return self.property(0x5466727a) as! GBAItem} // "Tfrz"
    public var masterVolume: GBAItem {return self.property(0x44666d56) as! GBAItem} // "DfmV"
    public var miniaturizable: GBAItem {return self.property(0x69736d6e) as! GBAItem} // "ismn"
    public var miniaturized: GBAItem {return self.property(0x706d6e64) as! GBAItem} // "pmnd"
    public var modal: GBAItem {return self.property(0x706d6f64) as! GBAItem} // "pmod"
    public var modified: GBAItem {return self.property(0x696d6f64) as! GBAItem} // "imod"
    public var muted: GBAItem {return self.property(0x544d7574) as! GBAItem} // "TMut"
    public var name: GBAItem {return self.property(0x706e616d) as! GBAItem} // "pnam"
    public var pagesAcross: GBAItem {return self.property(0x6c776c61) as! GBAItem} // "lwla"
    public var pagesDown: GBAItem {return self.property(0x6c776c64) as! GBAItem} // "lwld"
    public var pan: GBAItem {return self.property(0x5470616e) as! GBAItem} // "Tpan"
    public var path: GBAItem {return self.property(0x70707468) as! GBAItem} // "ppth"
    public var properties: GBAItem {return self.property(0x70414c4c) as! GBAItem} // "pALL"
    public var realInstrument: GBAItem {return self.property(0x54617564) as! GBAItem} // "Taud"
    public var recordEnabled: GBAItem {return self.property(0x5452656e) as! GBAItem} // "TRen"
    public var requestedPrintTime: GBAItem {return self.property(0x6c777174) as! GBAItem} // "lwqt"
    public var resizable: GBAItem {return self.property(0x7072737a) as! GBAItem} // "prsz"
    public var selected: GBAItem {return self.property(0x54456e61) as! GBAItem} // "TEna"
    public var size: GBAItem {return self.property(0x7074737a) as! GBAItem} // "ptsz"
    public var softwareInstrument: GBAItem {return self.property(0x546d6964) as! GBAItem} // "Tmid"
    public var soloed: GBAItem {return self.property(0x54736f6c) as! GBAItem} // "Tsol"
    public var startingPage: GBAItem {return self.property(0x6c776670) as! GBAItem} // "lwfp"
    public var stereo: GBAItem {return self.property(0x54737465) as! GBAItem} // "Tste"
    public var targetPrinter: GBAItem {return self.property(0x74727072) as! GBAItem} // "trpr"
    public var tempo: GBAItem {return self.property(0x4466546d) as! GBAItem} // "DfTm"
    public var titled: GBAItem {return self.property(0x70746974) as! GBAItem} // "ptit"
    public var trackVolume: GBAItem {return self.property(0x54766f6c) as! GBAItem} // "Tvol"
    public var version: GBAItem {return self.property(0x76657273) as! GBAItem} // "vers"
    public var visible: GBAItem {return self.property(0x70766973) as! GBAItem} // "pvis"
    public var zoomable: GBAItem {return self.property(0x69737a6d) as! GBAItem} // "iszm"
    public var zoomed: GBAItem {return self.property(0x707a756d) as! GBAItem} // "pzum"

    // Elements
    public var applications: GBAItems {return self.elements(0x63617070) as! GBAItems} // "capp"
    public var attachments: GBAItems {return self.elements(0x61747473) as! GBAItems} // "atts"
    public var attributeRuns: GBAItems {return self.elements(0x63617472) as! GBAItems} // "catr"
    public var characters: GBAItems {return self.elements(0x63686120) as! GBAItems} // "cha\0x20"
    public var colors: GBAItems {return self.elements(0x636f6c72) as! GBAItems} // "colr"
    public var items: GBAItems {return self.elements(0x636f626a) as! GBAItems} // "cobj"
    public var paragraphs: GBAItems {return self.elements(0x63706172) as! GBAItems} // "cpar"
    public var printSettingss: GBAItems {return self.elements(0x70736574) as! GBAItems} // "pset"
    public var songs: GBAItems {return self.elements(0x646f6375) as! GBAItems} // "docu"
    public var texts: GBAItems {return self.elements(0x63747874) as! GBAItems} // "ctxt"
    public var tracks: GBAItems {return self.elements(0x54724b73) as! GBAItems} // "TrKs"
    public var windows: GBAItems {return self.elements(0x6377696e) as! GBAItems} // "cwin"
    public var words: GBAItems {return self.elements(0x63776f72) as! GBAItems} // "cwor"
}


/******************************************************************************/
// Specifier subclasses add app-specific extensions

// beginning/end/before/after
public class GBAInsertion: SwiftAutomation.InsertionSpecifier, GBACommand {}


// property/by-index/by-name/by-id/previous/next/first/middle/last/any
public class GBAItem: SwiftAutomation.ObjectSpecifier, GBAObject {
    public typealias InsertionSpecifierType = GBAInsertion
    public typealias ObjectSpecifierType = GBAItem
    public typealias MultipleObjectSpecifierType = GBAItems
}

// by-range/by-test/all
public class GBAItems: GBAItem, SwiftAutomation.MultipleObjectSpecifierExtension {}

// App/Con/Its
public class GBARoot: SwiftAutomation.RootSpecifier, GBAObject, SwiftAutomation.RootSpecifierExtension {
    public typealias InsertionSpecifierType = GBAInsertion
    public typealias ObjectSpecifierType = GBAItem
    public typealias MultipleObjectSpecifierType = GBAItems
    public override class var untargetedAppData: SwiftAutomation.AppData { return _untargetedAppData }
}

// Application
public class GarageBand: GBARoot, SwiftAutomation.Application {
    public convenience init(launchOptions: SwiftAutomation.LaunchOptions = SwiftAutomation.DefaultLaunchOptions, relaunchMode: SwiftAutomation.RelaunchMode = SwiftAutomation.DefaultRelaunchMode) {
        self.init(rootObject: SwiftAutomation.AppRootDesc, appData: Swift.type(of:self).untargetedAppData.targetedCopy(
                  .bundleIdentifier("com.apple.garageband", true), launchOptions: launchOptions, relaunchMode: relaunchMode))
    }
}

// App/Con/Its root objects used to construct untargeted specifiers; these can be used to construct specifiers for use in commands, though cannot send commands themselves

public let GBAApp = _untargetedAppData.app as! GBARoot
public let GBACon = _untargetedAppData.con as! GBARoot
public let GBAIts = _untargetedAppData.its as! GBARoot


/******************************************************************************/
// Static types

public typealias GBARecord = [GBASymbol:Any] // default Swift type for AERecordDescs







