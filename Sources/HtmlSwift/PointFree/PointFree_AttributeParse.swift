//
// https://github.com/atacan
// 30.07.22

import Foundation
import Html
import SwiftSoup

func codeOfAttribute(_ attribute: SwiftSoup.Attribute, of element: Element) -> String {
    switch attribute.getKey() {
        // MARK: Bool

    case "async", "autofocus", "autoplay", "checked", "cols", "controls", "default", "defer", "disabled", "hidden", "loop", "multiple", "muted", "novalidate", "open", "readonly", "required", "reversed", "rows", "sandbox", "selected", "spellcheck", "start":
        return StandardTypeAttribute<DefaultedBool>(attribute: attribute).swiftCode
    case "aria-atomic", "aria-busy", "aria-disabled", "aria-modal", "aria-multiline", "aria-multiselectable", "aria-readonly", "aria-required":
        return StandardTypeAttribute<DefaultedBool>(attribute: attribute).swiftCode

        // MARK: Integer

    case "colspan", "height", "maxlength", "minlength", "rowspan", "span", "step", "tabindex", "width":
        return StandardTypeAttribute<Int>(attribute: attribute).swiftCode
    case "aria-colcount", "aria-colindex", "aria-colspan", "aria-level", "aria-posinset", "aria-rowcount", "aria-rowindex", "aria-rowspan", "aria-setsize":
        return StandardTypeAttribute<Int>(attribute: attribute).swiftCode

        // MARK: Double

    case "max", "min":
        return StandardTypeAttribute<Double>(attribute: attribute).swiftCode
    case "aria-valuemax", "aria-valuemin", "aria-valuenow":
        return StandardTypeAttribute<Double>(attribute: attribute).swiftCode

        // MARK: Date

    case "datetime":
        return StandardTypeAttribute<Date>(attribute: attribute).swiftCode

        // MARK: String

    case "abbr", "action", "alt", "cite", "class", "for", "form", "headers", "href", "id", "label", "media", "nonce", "pattern", "placeholder", "poster", "src", "srcset", "title":
        return PredefinedMethodAttribute(attribute: attribute).swiftCode
    case "aria-activedescendant", "aria-controls", "aria-describedby", "aria-details", "aria-errormessage", "aria-flowto", "aria-keyshortcuts", "aria-label", "aria-labelledby", "aria-owns", "aria-placeholder", "aria-roledescription", "aria-valuetext":
        return PredefinedMethodAttribute(attribute: attribute).swiftCode

        // MARK: Enums

    case "accept":
        return EnumAttribute<Html.Accept>(attribute: attribute).swiftCode
    case "enctype":
        return EnumAttribute<Html.Attribute<Html.Tag.Form>.Enctype>(attribute: attribute).swiftCode
    case "method":
        return EnumAttribute<Html.FormMethod>(attribute: attribute).swiftCode
    case "contenteditable":
        return EnumAttribute<Html.Attribute<Any>.Contenteditable>(attribute: attribute).swiftCode
    case "crossorigin":
        return EnumAttribute<Html.Attribute<AnyHasCrossorigin>.Crossorigin>(attribute: attribute).swiftCode
    case "dir":
        return EnumAttribute<Html.Attribute<Any>.Direction>(attribute: attribute).swiftCode
    case "draggable":
        return EnumAttribute<Html.Attribute<Any>.Draggable>(attribute: attribute).swiftCode
    case "kind":
        return EnumAttribute<Html.TrackKind>(attribute: attribute).swiftCode
    case "lang":
        return EnumAttribute<Html.Attribute<Any>.Language>(attribute: attribute).swiftCode
    case "preload":
        return EnumAttribute<Html.Attribute<AnyHasPreload>.Preload>(attribute: attribute).swiftCode
    case "srclang":
        return EnumAttribute<Html.Attribute<Any>.Language>(attribute: attribute).swiftCode
    case "scope":
        return EnumAttribute<Html.ThScope>(attribute: attribute).swiftCode
    case "shape":
        return EnumAttribute<Html.AreaShape>(attribute: attribute).swiftCode
    case "translate":
        return EnumAttribute<Html.Attribute<Any>.Translate>(attribute: attribute).swiftCode
    case "wrap":
        return EnumAttribute<Html.TextareaWrap>(attribute: attribute).swiftCode

    case "aria-autocomplete":
        return EnumAttribute<Html.Attribute<Any>.AriaAutocomplete>(attribute: attribute).swiftCode
    case "aria-checked", "aria-pressed":
        return EnumAttribute<Html.Attribute<Any>.AriaToggled>(attribute: attribute).swiftCode
    case "aria-current":
        return EnumAttribute<Html.Attribute<Any>.AriaCurrent>(attribute: attribute).swiftCode
    case "aria-dropeffect":
        return EnumAttribute<Html.Attribute<Any>.AriaDropeffect>(attribute: attribute).swiftCode
    case "aria-expanded", "aria-grabbed", "aria-hidden", "aria-selected":
        return EnumAttribute<Html.Attribute<Any>.AriaBoolean>(attribute: attribute).swiftCode
    case "aria-haspopup":
        return EnumAttribute<Html.Attribute<Any>.AriaHaspopup>(attribute: attribute).swiftCode
    case "aria-invalid":
        return EnumAttribute<Html.Attribute<Any>.AriaInvalid>(attribute: attribute).swiftCode
    case "aria-live":
        return EnumAttribute<Html.Attribute<Any>.AriaLive>(attribute: attribute).swiftCode
    case "aria-orientation":
        return EnumAttribute<Html.Attribute<Any>.AriaOrientation>(attribute: attribute).swiftCode
    case "aria-relevant":
        return EnumAttribute<Html.Attribute<Any>.AriaRelevant>(attribute: attribute).swiftCode
    case "aria-sort":
        return EnumAttribute<Html.Attribute<Any>.AriaSort>(attribute: attribute).swiftCode

        // MARK: Enum-like Structs

    case "charset", "rel", "target":
        return StructAttribute(attribute: attribute).swiftCode
    // defined as static variables. we can't programmatically get them.
    //        case "charset":
    //            return EnumAttribute<Html.Charset>(attribute: attribute).swiftCode
    //        case "rel":
    //            return EnumAttribute<Html.Attribute<AnyHasRel>.Rel>(attribute: attribute).swiftCode
    //        case "srcset":
    //        case "target":
    //            return EnumAttribute<Html.Attribute<AnyHasTarget>.Target>(attribute: attribute).swiftCode

        
        
        // MARK: Parent-dependent Attributes
    case "content":
        switch element.nodeName() {
        case "meta":
            return FunctionArgumentAttribute(attribute: attribute).swiftCode
        default:
            return PredefinedMethodAttribute(attribute: attribute).swiftCode
        }
    case "name":
        switch element.nodeName() {
        case "meta":
            return FunctionArgumentAttribute(attribute: attribute).swiftCode
        default:
            return PredefinedMethodAttribute(attribute: attribute).swiftCode
        }
    case "type":
        switch element.nodeName() {
        case "button":
            return EnumAttribute<Html.ButtonType>(attribute: attribute).swiftCode
        case "input":
            return EnumAttribute<Html.InputType>(attribute: attribute).swiftCode
        case "ol":
            return EnumAttribute<Html.ListType>(attribute: attribute).swiftCode
        default:
            return UndefinedAttribute(attribute: attribute).swiftCode
        }
    case "value":
        switch element.nodeName() {
        case "li":
            return StandardTypeAttribute<Int>(attribute: attribute).swiftCode
        case "meter", "progress":
            return StandardTypeAttribute<Double>(attribute: attribute).swiftCode
        case "input":
            return PredefinedMethodAttribute(attribute: attribute).swiftCode
        default:
            return UndefinedAttribute(attribute: attribute).swiftCode
        }

        // MARK: default
    default:
        return UndefinedAttribute(attribute: attribute).swiftCode
    }
}
