package com.clothobserve.todo
{
	import feathers.controls.*;
	import feathers.controls.popups.*;
	import feathers.controls.renderers.*;
	import feathers.controls.text.*;
	import feathers.core.*;
	import feathers.layout.*;
	import feathers.skins.*;
	import feathers.system.DeviceCapabilities;
	import feathers.themes.StyleNameFunctionTheme;
	import starling.text.TextFormat;
	import starling.textures.*;
	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.display.Image;
	import flash.geom.Rectangle;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.StageQuality;
	
	/**
	 * Adjusted Topcoat Mobile UI theme
	 */
	public final class ClientTheme extends StyleNameFunctionTheme
	{
		[Embed(source="../../SourceCodePro-Semibold.ttf", fontName="SourceCodeProSB", mimeType="application/x-font", embedAsCFF="true")]
		private static const SOURCE_CODE_PRO:Class;
		
		public static const FONT_NAME:String = "SourceCodeProSB";
		public static const FONT_NAME_STACK:String = "SourceCodeProSB,Source Code Pro,Helvetica,_sans";
		
		// NEEDS TO BE ADJUSTED!
		public static const TEXT_DARK:uint = 0x222222;
		public static const TEXT_LIGHT:uint = 0xFFFFFF;
		public static const TEXT_SELECTED:uint = 0x0D47A1;
		public static const TEXT_DISABLED:uint = 0x777777;
		public static const TEXT_SELECTED_DISABLED:uint = 0x2196F3;
		public static const TEXT_ACTION_DISABLED:uint = 0x73FF65;
		public static const TEXT_DANGER_DISABLED:uint = 0xF7B4AF;
		public static const BACKGROUND:uint = 0x5C6BC0;
		public static const LIST_BACKGROUND:uint = 0x8C9EFF;
		public static const COLOR_OVERLAY:uint = 0x454545;
		public static const ALPHA_OVERLAY:Number = 0.8;
		public static const COLOR_DRAWERS_DIVIDER:uint = 0x999999;
		
		private static const BUTTON_SCALE9_GRID:Rectangle = new Rectangle(7, 7, 1, 1);
		private static const BACK_BUTTON_SCALE9_GRID:Rectangle = new Rectangle(26, 5, 10, 40);
		private static const FORWARD_BUTTON_SCALE9_GRID:Rectangle = new Rectangle(5, 5, 10, 10);
		private static const TEXT_INPUT_SCALE9_GRID:Rectangle = new Rectangle(7, 7, 1, 1);
		private static const HORIZONTAL_MINIMUM_TRACK_SCALE9_GRID:Rectangle = new Rectangle(5, 0, 1, 13);
		private static const HORIZONTAL_MAXIMUM_TRACK_SCALE9_GRID:Rectangle = new Rectangle(0, 0, 1, 13);
		private static const VERTICAL_MINIMUM_TRACK_SCALE9_GRID:Rectangle = new Rectangle(0, 0, 13, 1);
		private static const VERTICAL_MAXIMUM_TRACK_SCALE9_GRID:Rectangle = new Rectangle(0, 5, 13, 1);
		private static const BAR_HORIZONTAL_SCALE9_GRID:Rectangle = new Rectangle(8, 8, 1, 1);
		private static const BAR_VERTICAL_SCALE9_GRID:Rectangle = new Rectangle(8, 8, 1, 1);
		private static const HEADER_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle(3, 3, 10, 56);
		private static const TAB_SCALE9_GRID:Rectangle = new Rectangle(3, 3, 5, 5);
		private static const SEARCH_INPUT_SCALE9_GRID:Rectangle = new Rectangle(25, 25, 10, 1);
		private static const BACKGROUND_POPUP_SCALE9_GRID:Rectangle = new Rectangle(5, 5, 10, 10);
		private static const POP_UP_DRAWER_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle(1, 3, 3, 4);
		private static const LIST_ITEM_SCALE9_GRID:Rectangle = new Rectangle(2, 2, 1, 6);
		private static const GROUPED_LIST_HEADER_OR_FOOTER_SCALE9_GRID:Rectangle = new Rectangle(2, 2, 1, 6);
		private static const SPINNER_LIST_OVERLAY_SCALE9_GRID:Rectangle = new Rectangle(2, 5, 1, 1);
		private static const HORIZONTAL_SIMPLE_SCROLL_BAR_SCALE9_GRID:Rectangle = new Rectangle(5, 0, 3, 6);
		private static const VERTICAL_SIMPLE_SCROLL_BAR_SCALE9_GRID:Rectangle = new Rectangle(0, 5, 6, 3);
		
		private static const THEME_STYLE_NAME_VERTICAL_SIMPLE_SCROLL_BAR_THUMB:String = "scroll-bar-thumb";
		private static const THEME_STYLE_NAME_HORIZONTAL_SIMPLE_SCROLL_BAR_THUMB:String = "horizontal-simple-scroll-bar-thumb";
		private static const THEME_STYLE_NAME_HORIZONTAL_SLIDER_THUMB:String = "horizontal-slider-thumb";
		private static const THEME_STYLE_NAME_HORIZONTAL_SLIDER_MINIMUM_TRACK:String = "horizontal-slider-minimum-track";
		private static const THEME_STYLE_NAME_HORIZONTAL_SLIDER_MAXIMUM_TRACK:String = "horizontal-slider-maximum-track";
		private static const THEME_STYLE_NAME_VERTICAL_SLIDER_THUMB:String = "vertical-slider-thumb";
		private static const THEME_STYLE_NAME_VERTICAL_SLIDER_MINIMUM_TRACK:String = "vertical-slider-minimum-track";
		private static const THEME_STYLE_NAME_VERTICAL_SLIDER_MAXIMUM_TRACK:String = "vertical-slider-maximum-track";
		private static const THEME_STYLE_NAME_ALERT_BUTTON_GROUP_BUTTON:String = "alert-button-group-button";
		private static const THEME_STYLE_NAME_ALERT_BUTTON_GROUP_LAST_BUTTON:String = "alert-button-group-last-button";
		private static const THEME_STYLE_NAME_GROUPED_LIST_FIRST_ITEM_RENDERER:String = "grouped-list-first-item-renderer";
		private static const THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER:String = "spinner-list-item-renderer";
		private static const THEME_STYLE_NAME_DATE_TIME_SPINNER_LIST_ITEM_RENDERER:String = "date-time-spinner-list-item-renderer";
		private static const THEME_STYLE_NAME_POP_UP_DRAWER:String = "pop-up-drawer";
		private static const THEME_STYLE_NAME_POP_UP_DRAWER_HEADER:String = "pop-up-drawer-header";
		private static const THEME_STYLE_NAME_TABLET_PICKER_LIST_ITEM_RENDERER:String = "tablet-picker-list-item-renderer";
		
		public function ClientTheme()
		{
			super();
			initialize();
		}
		
		private const gridSize:int = 70;
		private const gutterSize:int = 20;
		private const smallGutterSize:int = 10;
		private const extraSmallGutterSize:int = 5;
		private const borderSize:int = 1;
		private const controlSize:int = 50;
		private const smallControlSize:int = 16;
		private const wideControlSize:int = 230;
		private const popUpFillSize:int = 600;
		private const thumbSize:int = 34;
		private const shadowSize:int = 2;
		private const calloutBackgroundMinSize:int = 53;
		private const calloutVerticalArrowGap:int = -8;
		private const calloutHorizontalArrowGap:int = -7;
		
		private const smallFontSize:int = 16;
		private const regularFontSize:int = 18;
		private const largeFontSize:int = 24;
		
		private const darkFontStyles:TextFormat = new TextFormat(FONT_NAME, regularFontSize, TEXT_DARK, HorizontalAlign.LEFT, VerticalAlign.TOP);
		private const lightFontStyles:TextFormat = new TextFormat(FONT_NAME, regularFontSize, TEXT_LIGHT, HorizontalAlign.LEFT, VerticalAlign.TOP);
		private const selectedFontStyles:TextFormat = new TextFormat(FONT_NAME, regularFontSize, TEXT_SELECTED, HorizontalAlign.LEFT, VerticalAlign.TOP);
		private const darkDisabledFontStyles:TextFormat = new TextFormat(FONT_NAME, regularFontSize, TEXT_DISABLED, HorizontalAlign.LEFT, VerticalAlign.TOP);
		private const selectedDisabledFontStyles:TextFormat = new TextFormat(FONT_NAME, regularFontSize, TEXT_SELECTED_DISABLED, HorizontalAlign.LEFT, VerticalAlign.TOP);
		private const actionDisabledFontStyles:TextFormat = new TextFormat(FONT_NAME, regularFontSize, TEXT_ACTION_DISABLED, HorizontalAlign.LEFT, VerticalAlign.TOP);
		private const dangerDisabledFontStyles:TextFormat = new TextFormat(FONT_NAME, regularFontSize, TEXT_DANGER_DISABLED, HorizontalAlign.LEFT, VerticalAlign.TOP);
		private const centeredFontStyles:TextFormat = new TextFormat(FONT_NAME, regularFontSize, TEXT_DARK, HorizontalAlign.CENTER, VerticalAlign.TOP);
		private const centeredDisabledFontStyles:TextFormat = new TextFormat(FONT_NAME, regularFontSize, TEXT_DISABLED, HorizontalAlign.CENTER, VerticalAlign.TOP);
		private const smallDarkFontStyles:TextFormat = new TextFormat(FONT_NAME, smallFontSize, TEXT_DARK, HorizontalAlign.LEFT, VerticalAlign.TOP);
		private const smallSelectedFontStyles:TextFormat = new TextFormat(FONT_NAME, smallFontSize, TEXT_SELECTED, HorizontalAlign.LEFT, VerticalAlign.TOP);
		private const smallDisabledFontStyles:TextFormat = new TextFormat(FONT_NAME, smallFontSize, TEXT_DISABLED, HorizontalAlign.LEFT, VerticalAlign.TOP);
		private const largeDarkFontStyles:TextFormat = new TextFormat(FONT_NAME, largeFontSize, TEXT_DARK, HorizontalAlign.LEFT, VerticalAlign.TOP);
		private const largeDisabledFontStyles:TextFormat = new TextFormat(FONT_NAME, largeFontSize, TEXT_DISABLED, HorizontalAlign.LEFT, VerticalAlign.TOP);
		private const darkScrollTextFontStyles:TextFormat = new TextFormat(FONT_NAME_STACK, regularFontSize, TEXT_DARK, HorizontalAlign.LEFT, VerticalAlign.TOP);
		private const darkScrollTextDisabledFontStyles:TextFormat = new TextFormat(FONT_NAME_STACK, regularFontSize, TEXT_DISABLED, HorizontalAlign.LEFT, VerticalAlign.TOP);
		
		private var buttonUpTexture:Texture;
		private var buttonDownTexture:Texture;
		private var buttonDisabledTexture:Texture;
		private var quietButtonDownTexture:Texture;
		private var backButtonUpTexture:Texture;
		private var backButtonDownTexture:Texture;
		private var backButtonDisabledTexture:Texture;
		private var forwardButtonUpTexture:Texture;
		private var forwardButtonDownTexture:Texture;
		private var forwardButtonDisabledTexture:Texture;
		private var dangerButtonUpTexture:Texture;
		private var dangerButtonDownTexture:Texture;
		private var dangerButtonDisabledTexture:Texture;
		private var callToActionButtonUpTexture:Texture;
		private var callToActionButtonDownTexture:Texture;
		private var callToActionButtonDisabledTexture:Texture;
		private var toggleButtonSelectedUpTexture:Texture;
		private var toggleButtonSelectedDisabledTexture:Texture;
		private var toggleSwitchOnTrackTexture:Texture;
		private var toggleSwitchOnTrackDisabledTexture:Texture;
		private var toggleSwitchOffTrackTexture:Texture;
		private var toggleSwitchOffTrackDisabledTexture:Texture;
		private var checkUpIconTexture:Texture;
		private var checkSelectedUpIconTexture:Texture;
		private var checkDownIconTexture:Texture;
		private var checkDisabledIconTexture:Texture;
		private var checkSelectedDownIconTexture:Texture;
		private var checkSelectedDisabledIconTexture:Texture;
		private var radioUpIconTexture:Texture;
		private var radioSelectedUpIconTexture:Texture;
		private var radioDownIconTexture:Texture;
		private var radioDisabledIconTexture:Texture;
		private var radioSelectedDownIconTexture:Texture;
		private var radioSelectedDisabledIconTexture:Texture;
		private var horizontalProgressBarFillTexture:Texture;
		private var horizontalProgressBarFillDisabledTexture:Texture;
		private var horizontalProgressBarBackgroundTexture:Texture;
		private var horizontalProgressBarBackgroundDisabledTexture:Texture;
		private var verticalProgressBarFillTexture:Texture;
		private var verticalProgressBarFillDisabledTexture:Texture;
		private var verticalProgressBarBackgroundTexture:Texture;
		private var verticalProgressBarBackgroundDisabledTexture:Texture;
		private var headerBackgroundSkinTexture:Texture;
		private var verticalSimpleScrollBarThumbTexture:Texture;
		private var horizontalSimpleScrollBarThumbTexture:Texture;
		private var tabUpTexture:Texture;
		private var tabDownTexture:Texture;
		private var tabSelectedUpTexture:Texture;
		private var tabSelectedDisabledTexture:Texture;
		private var horizontalSliderMinimumTrackTexture:Texture;
		private var horizontalSliderMinimumTrackDisabledTexture:Texture;
		private var horizontalSliderMaximumTrackTexture:Texture;
		private var horizontalSliderMaximumTrackDisabledTexture:Texture;
		private var verticalSliderMinimumTrackTexture:Texture;
		private var verticalSliderMinimumTrackDisabledTexture:Texture;
		private var verticalSliderMaximumTrackTexture:Texture;
		private var verticalSliderMaximumTrackDisabledTexture:Texture;
		private var textInputBackgroundEnabledTexture:Texture;
		private var textInputBackgroundFocusedTexture:Texture;
		private var textInputBackgroundErrorTexture:Texture;
		private var textInputBackgroundDisabledTexture:Texture;
		private var searchTextInputBackgroundEnabledTexture:Texture;
		private var searchTextInputBackgroundFocusedTexture:Texture;
		private var searchTextInputBackgroundDisabledTexture:Texture;
		private var searchIconTexture:Texture;
		private var popUpBackgroundTexture:Texture;
		private var calloutTopArrowTexture:Texture;
		private var calloutRightArrowTexture:Texture;
		private var calloutBottomArrowTexture:Texture;
		private var calloutLeftArrowTexture:Texture;
		private var itemRendererUpTexture:Texture;
		private var itemRendererDownTexture:Texture;
		private var itemRendererSelectedTexture:Texture;
		private var firstItemRendererUpTexture:Texture;
		private var groupedListHeaderTexture:Texture;
		private var groupedListFooterTexture:Texture;
		private var pickerListButtonIcon:Texture;
		private var pickerListButtonDisabledIcon:Texture;
		private var popUpDrawerBackgroundTexture:Texture;
		private var spinnerListSelectionOverlayTexture:Texture;
		private var pageIndicatorNormalTexture:Texture;
		private var pageIndicatorSelectedTexture:Texture;
		private var treeDisclosureOpenIconTexture:Texture;
		private var treeDisclosureClosedIconTexture:Texture;
		
		[Embed(source="/../../themeAtlas.xml", mimeType="application/octet-stream")]
		private static const ATLAS_XML:Class;
		private static var atlas:TextureAtlas;
		
		override public function dispose():void
		{
			if (atlas)
			{
				atlas.dispose();
				atlas = null;
			}
			
			super.dispose();
		}

		private function initialize():void
		{
			initializeTextureAtlas();
			initializeTextures();
			initializeGlobals();
			initializeStyleProviders();
		}
		
		private function getAtlasBitmapData():BitmapData
		{
			var atlasSprite:CheckRThemeAtlas = new CheckRThemeAtlas();
			var atlasBitmapData:BitmapData = new BitmapData(512, 512, true, 0);
			atlasBitmapData.drawWithQuality(atlasSprite, null, null, null, null, true, StageQuality.HIGH);
			
			return atlasBitmapData;
		}
		
		private function initializeTextureAtlas():void
		{
			var atlasBitmapData:BitmapData = getAtlasBitmapData();
			var atlasTexture:Texture = Texture.fromBitmapData(atlasBitmapData, false, false, 2);
			atlasTexture.root.onRestore = onAtlasTextureRestore;
			atlasBitmapData.dispose();
			atlas = new TextureAtlas(atlasTexture, XML(new ATLAS_XML()));
		}
		
		private function onAtlasTextureRestore():void
		{
			var atlasBitmapData:BitmapData = getAtlasBitmapData();
			atlas.texture.root.uploadBitmapData(atlasBitmapData);
			atlasBitmapData.dispose();
		}
		
		private function initializeTextures():void
		{
			popUpBackgroundTexture = atlas.getTexture("background-popup");
			popUpDrawerBackgroundTexture = atlas.getTexture("pop-up-drawer-background");
			
			buttonUpTexture = atlas.getTexture("button-up");
			buttonDownTexture = atlas.getTexture("button-down");
			buttonDisabledTexture = atlas.getTexture("button-disabled");
			quietButtonDownTexture = atlas.getTexture("button-down");
			dangerButtonUpTexture = atlas.getTexture("button-danger-up");
			dangerButtonDownTexture = atlas.getTexture("button-danger-down");
			dangerButtonDisabledTexture = atlas.getTexture("button-danger-disabled");
			callToActionButtonUpTexture = atlas.getTexture("button-call-to-action-up");
			callToActionButtonDownTexture = atlas.getTexture("button-call-to-action-down");
			callToActionButtonDisabledTexture = atlas.getTexture("button-call-to-action-disabled");
			backButtonUpTexture = atlas.getTexture("button-back-up");
			backButtonDownTexture = atlas.getTexture("button-back-down");
			backButtonDisabledTexture = atlas.getTexture("button-back-disabled");
			forwardButtonUpTexture = atlas.getTexture("button-forward-up");
			forwardButtonDownTexture = atlas.getTexture("button-forward-down");
			forwardButtonDisabledTexture = atlas.getTexture("button-forward-disabled");
			toggleButtonSelectedUpTexture = atlas.getTexture("toggle-button-selected-up");
			toggleButtonSelectedDisabledTexture = atlas.getTexture("toggle-button-selected-disabled");
			
			calloutTopArrowTexture = atlas.getTexture("callout-arrow-top");
			calloutRightArrowTexture = atlas.getTexture("callout-arrow-right");
			calloutBottomArrowTexture = atlas.getTexture("callout-arrow-bottom");
			calloutLeftArrowTexture = atlas.getTexture("callout-arrow-left");
			
			checkUpIconTexture = atlas.getTexture("check-up");
			checkDownIconTexture = atlas.getTexture("check-down");
			checkDisabledIconTexture = atlas.getTexture("check-disabled");
			checkSelectedUpIconTexture = atlas.getTexture("check-selected-up");
			checkSelectedDownIconTexture = atlas.getTexture("check-selected-down");
			checkSelectedDisabledIconTexture = atlas.getTexture("check-selected-disabled");
			
			headerBackgroundSkinTexture = atlas.getTexture("header-background");
			
			itemRendererUpTexture = atlas.getTexture("list-item-up");
			itemRendererDownTexture = atlas.getTexture("list-item-down");
			itemRendererSelectedTexture = atlas.getTexture("list-item-selected");
			firstItemRendererUpTexture = atlas.getTexture("list-first-item-up");
			groupedListHeaderTexture = atlas.getTexture("grouped-list-header");
			groupedListFooterTexture = atlas.getTexture("grouped-list-footer");
			
			pageIndicatorNormalTexture = atlas.getTexture("page-indicator-normal");
			pageIndicatorSelectedTexture = atlas.getTexture("page-indicator-selected");
			
			pickerListButtonIcon = atlas.getTexture("picker-list-button");
			pickerListButtonDisabledIcon = atlas.getTexture("picker-list-button-disabled");
			
			horizontalProgressBarFillTexture = atlas.getTexture("progress-bar-horizontal-fill");
			horizontalProgressBarFillDisabledTexture = atlas.getTexture("progress-bar-horizontal-fill-disabled");
			horizontalProgressBarBackgroundTexture = atlas.getTexture("progress-bar-horizontal-background");
			horizontalProgressBarBackgroundDisabledTexture = atlas.getTexture("progress-bar-horizontal-background-disabled");
			verticalProgressBarFillTexture = atlas.getTexture("progress-bar-vertical-fill");
			verticalProgressBarFillDisabledTexture = atlas.getTexture("progress-bar-vertical-fill-disabled");
			verticalProgressBarBackgroundTexture = atlas.getTexture("progress-bar-vertical-background");
			verticalProgressBarBackgroundDisabledTexture = atlas.getTexture("progress-bar-vertical-background-disabled");
			
			radioUpIconTexture = atlas.getTexture("radio-up");
			radioDownIconTexture = atlas.getTexture("radio-down");
			radioDisabledIconTexture = atlas.getTexture("radio-disabled");
			radioSelectedUpIconTexture = atlas.getTexture("radio-selected-up");
			radioSelectedDownIconTexture = atlas.getTexture("radio-selected-down");
			radioSelectedDisabledIconTexture = atlas.getTexture("radio-selected-disabled");
			
			verticalSimpleScrollBarThumbTexture = atlas.getTexture("simple-scroll-bar-vertical-thumb");
			horizontalSimpleScrollBarThumbTexture = atlas.getTexture("simple-scroll-bar-horizontal-thumb");
			
			horizontalSliderMinimumTrackTexture = atlas.getTexture("slider-horizontal-minimum-track");
			horizontalSliderMinimumTrackDisabledTexture = atlas.getTexture("slider-horizontal-minimum-track-disabled");
			horizontalSliderMaximumTrackTexture = atlas.getTexture("slider-horizontal-maximum-track");
			horizontalSliderMaximumTrackDisabledTexture = atlas.getTexture("slider-horizontal-maximum-track-disabled");
			verticalSliderMinimumTrackTexture = atlas.getTexture("slider-vertical-minimum-track");
			verticalSliderMinimumTrackDisabledTexture = atlas.getTexture("slider-vertical-minimum-track-disabled");
			verticalSliderMaximumTrackTexture = atlas.getTexture("slider-vertical-maximum-track");
			verticalSliderMaximumTrackDisabledTexture = atlas.getTexture("slider-vertical-maximum-track-disabled");
			
			spinnerListSelectionOverlayTexture = atlas.getTexture("spinner-list-selection-overlay");
			
			tabUpTexture = atlas.getTexture("tab-up");
			tabDownTexture = atlas.getTexture("tab-down");
			tabSelectedUpTexture = atlas.getTexture("tab-selected-up");
			tabSelectedDisabledTexture = atlas.getTexture("tab-selected-disabled");
			
			textInputBackgroundEnabledTexture = atlas.getTexture("text-input-up");
			textInputBackgroundFocusedTexture = atlas.getTexture("text-input-focused");
			textInputBackgroundErrorTexture = atlas.getTexture("text-input-error");
			textInputBackgroundDisabledTexture = atlas.getTexture("text-input-disabled");
			searchTextInputBackgroundEnabledTexture = atlas.getTexture("search-input-up");
			searchTextInputBackgroundFocusedTexture = atlas.getTexture("search-input-focused");
			searchTextInputBackgroundDisabledTexture = atlas.getTexture("search-input-disabled");
			searchIconTexture = atlas.getTexture("search-input");
			
			toggleSwitchOnTrackTexture = atlas.getTexture("toggle-switch-on-track");
			toggleSwitchOnTrackDisabledTexture = atlas.getTexture("toggle-switch-on-track-disabled");
			toggleSwitchOffTrackTexture = atlas.getTexture("toggle-switch-off-track");
			toggleSwitchOffTrackDisabledTexture = atlas.getTexture("toggle-switch-off-track-disabled");
			
			treeDisclosureOpenIconTexture = atlas.getTexture("tree-disclosure-open");
			treeDisclosureClosedIconTexture = atlas.getTexture("tree-disclosure-closed");
		}
		
		private function initializeGlobals():void
		{
			FeathersControl.defaultTextRendererFactory = textRendererFactory;
			FeathersControl.defaultTextEditorFactory = textEditorFactory;
			
			PopUpManager.overlayFactory = popUpOverlayFactory;
			Callout.stagePadding = smallGutterSize;
		}
		
		private static function textRendererFactory():TextBlockTextRenderer { return new TextBlockTextRenderer(); }
		private static function textEditorFactory():StageTextTextEditor { return new StageTextTextEditor(); }
		private static function popUpOverlayFactory():DisplayObject
		{
			var quad:Quad = new Quad(10, 10, COLOR_OVERLAY);
			quad.alpha = ALPHA_OVERLAY;
			return quad;
		}
		
		private function initializeStyleProviders():void
		{
			var buttonStyle:StyleNameFunctionStyleProvider = getStyleProviderForClass(Button);
			var toggleButtonStyle:StyleNameFunctionStyleProvider = getStyleProviderForClass(ToggleButton);
			var labelStyle:StyleNameFunctionStyleProvider = getStyleProviderForClass(Label);
			var headerStyle:StyleNameFunctionStyleProvider = getStyleProviderForClass(Header);
			var listStyle:StyleNameFunctionStyleProvider = getStyleProviderForClass(List);
			var dGLHOFRStyle:StyleNameFunctionStyleProvider = getStyleProviderForClass(DefaultGroupedListHeaderOrFooterRenderer);
			var dLIRStyle:StyleNameFunctionStyleProvider = getStyleProviderForClass(DefaultListItemRenderer);
			
			// Alert
			getStyleProviderForClass(Alert).defaultStyleFunction = setAlertStyles;
			getStyleProviderForClass(ButtonGroup).setFunctionForStyleName(Alert.DEFAULT_CHILD_STYLE_NAME_BUTTON_GROUP, setAlertButtonGroupStyles);
			buttonStyle.setFunctionForStyleName(THEME_STYLE_NAME_ALERT_BUTTON_GROUP_BUTTON, setAlertButtonGroupButtonStyles);
			headerStyle.setFunctionForStyleName(Alert.DEFAULT_CHILD_STYLE_NAME_HEADER, setHeaderWithoutBackgroundStyles);
			
			// Auto-Complete
			getStyleProviderForClass(AutoComplete).defaultStyleFunction = setTextInputStyles;
			listStyle.setFunctionForStyleName(AutoComplete.DEFAULT_CHILD_STYLE_NAME_LIST, setDropDownListStyles);
			
			// Button
			buttonStyle.defaultStyleFunction = setButtonStyles;
			buttonStyle.setFunctionForStyleName(Button.ALTERNATE_STYLE_NAME_QUIET_BUTTON, setQuietButtonStyles);
			buttonStyle.setFunctionForStyleName(Button.ALTERNATE_STYLE_NAME_DANGER_BUTTON, setDangerButtonStyles);
			buttonStyle.setFunctionForStyleName(Button.ALTERNATE_STYLE_NAME_CALL_TO_ACTION_BUTTON, setCallToActionButtonStyles);
			buttonStyle.setFunctionForStyleName(Button.ALTERNATE_STYLE_NAME_BACK_BUTTON, setBackButtonStyles);
			buttonStyle.setFunctionForStyleName(Button.ALTERNATE_STYLE_NAME_FORWARD_BUTTON, setForwardButtonStyles);
			
			// Button Group
			getStyleProviderForClass(ButtonGroup).defaultStyleFunction = setButtonGroupStyles;
			buttonStyle.setFunctionForStyleName(ButtonGroup.DEFAULT_CHILD_STYLE_NAME_BUTTON, setButtonGroupButtonStyles);
			toggleButtonStyle.setFunctionForStyleName(ButtonGroup.DEFAULT_CHILD_STYLE_NAME_BUTTON, setButtonStyles);
			
			// Callout
			getStyleProviderForClass(Callout).defaultStyleFunction = setCalloutStyles;
			
			// Check
			getStyleProviderForClass(Check).defaultStyleFunction = setCheckStyles;
			
			// Date Time Spinner
			getStyleProviderForClass(DateTimeSpinner).defaultStyleFunction = setDateTimeSpinnerStyles;
			dLIRStyle.setFunctionForStyleName(THEME_STYLE_NAME_DATE_TIME_SPINNER_LIST_ITEM_RENDERER, setDateTimeSpinnerListItemRendererStyles);
			
			// Drawers
			getStyleProviderForClass(Drawers).defaultStyleFunction = setDrawersStyles;
			
			// Grouped List
			getStyleProviderForClass(GroupedList).defaultStyleFunction = setGroupedListStyles;
			getStyleProviderForClass(GroupedList).setFunctionForStyleName(GroupedList.ALTERNATE_STYLE_NAME_INSET_GROUPED_LIST, setInsetGroupedListStyles);
			getStyleProviderForClass(DefaultGroupedListItemRenderer).defaultStyleFunction = setItemRendererStyles;
			dGLHOFRStyle.defaultStyleFunction = setGroupedListHeaderRendererStyles;
			dGLHOFRStyle.setFunctionForStyleName(GroupedList.DEFAULT_CHILD_STYLE_NAME_FOOTER_RENDERER, setGroupedListFooterRendererStyles);
			dGLHOFRStyle.setFunctionForStyleName(GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_HEADER_RENDERER, setGroupedListInsetHeaderRendererStyles);
			dGLHOFRStyle.setFunctionForStyleName(GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_FOOTER_RENDERER, setGroupedListInsetFooterRendererStyles);
			// Custom style for the first item in GroupedList (without highlight at the top)
			getStyleProviderForClass(DefaultGroupedListItemRenderer).setFunctionForStyleName(THEME_STYLE_NAME_GROUPED_LIST_FIRST_ITEM_RENDERER, setGroupedListFirstItemRendererStyles);
			
			// Header
			headerStyle.defaultStyleFunction = setHeaderStyles;
			
			// Label
			labelStyle.defaultStyleFunction = setLabelStyles;
			labelStyle.setFunctionForStyleName(Label.ALTERNATE_STYLE_NAME_HEADING, setHeadingLabelStyles);
			labelStyle.setFunctionForStyleName(Label.ALTERNATE_STYLE_NAME_DETAIL, setDetailLabelStyles);
			
			// Layout Group
			getStyleProviderForClass(LayoutGroup).setFunctionForStyleName(LayoutGroup.ALTERNATE_STYLE_NAME_TOOLBAR, setToolbarLayoutGroupStyles);
			
			// List
			listStyle.defaultStyleFunction = setListStyles;
			dLIRStyle.defaultStyleFunction = setItemRendererStyles;
			
			// Numeric Stepper
			getStyleProviderForClass(NumericStepper).defaultStyleFunction = setNumericStepperStyles;
			getStyleProviderForClass(TextInput).setFunctionForStyleName(NumericStepper.DEFAULT_CHILD_STYLE_NAME_TEXT_INPUT, setNumericStepperTextInputStyles);
			buttonStyle.setFunctionForStyleName(NumericStepper.DEFAULT_CHILD_STYLE_NAME_DECREMENT_BUTTON, setNumericStepperButtonStyles);
			buttonStyle.setFunctionForStyleName(NumericStepper.DEFAULT_CHILD_STYLE_NAME_INCREMENT_BUTTON, setNumericStepperButtonStyles);
			
			// Page Indicator
			getStyleProviderForClass(PageIndicator).defaultStyleFunction = setPageIndicatorStyles;
			
			// Panel
			getStyleProviderForClass(Panel).defaultStyleFunction = setPanelStyles;
			headerStyle.setFunctionForStyleName(Panel.DEFAULT_CHILD_STYLE_NAME_HEADER, setHeaderWithoutBackgroundStyles);
			
			// Panel Screen
			getStyleProviderForClass(PanelScreen).defaultStyleFunction = setPanelScreenStyles;
			headerStyle.setFunctionForStyleName(PanelScreen.DEFAULT_CHILD_STYLE_NAME_HEADER, setPanelScreenHeaderStyles);
			
			// Picker List
			getStyleProviderForClass(PickerList).defaultStyleFunction = setPickerListStyles;
			listStyle.setFunctionForStyleName(PickerList.DEFAULT_CHILD_STYLE_NAME_LIST, setPickerListListStyles);
			buttonStyle.setFunctionForStyleName(PickerList.DEFAULT_CHILD_STYLE_NAME_BUTTON, setPickerListButtonStyles);
			getStyleProviderForClass(Panel).setFunctionForStyleName(THEME_STYLE_NAME_POP_UP_DRAWER, setPickerListPopUpDrawerStyles);
			headerStyle.setFunctionForStyleName(THEME_STYLE_NAME_POP_UP_DRAWER_HEADER, setHeaderStyles);
			dLIRStyle.setFunctionForStyleName(THEME_STYLE_NAME_TABLET_PICKER_LIST_ITEM_RENDERER, setTabletPickerListItemRendererStyles);
			
			// Progress Bar
			getStyleProviderForClass(ProgressBar).defaultStyleFunction = setProgressBarStyles;
			
			// Radio
			getStyleProviderForClass(Radio).defaultStyleFunction = setRadioStyles;
			
			// Scroll Container
			getStyleProviderForClass(ScrollContainer).defaultStyleFunction = setScrollContainerStyles;
			getStyleProviderForClass(ScrollContainer).setFunctionForStyleName(ScrollContainer.ALTERNATE_STYLE_NAME_TOOLBAR, setToolbarScrollContainerStyles);
			
			// Scroll Text
			getStyleProviderForClass(ScrollText).defaultStyleFunction = setScrollTextStyles;
			
			// Simple Scroll Bar
			getStyleProviderForClass(SimpleScrollBar).defaultStyleFunction = setSimpleScrollBarStyles;
			buttonStyle.setFunctionForStyleName(THEME_STYLE_NAME_VERTICAL_SIMPLE_SCROLL_BAR_THUMB, setVerticalSimpleScrollBarThumbStyles);
			buttonStyle.setFunctionForStyleName(THEME_STYLE_NAME_HORIZONTAL_SIMPLE_SCROLL_BAR_THUMB, setHorizontalSimpleScrollBarThumbStyles);
			
			// Slider
			getStyleProviderForClass(Slider).defaultStyleFunction = setSliderStyles;
			buttonStyle.setFunctionForStyleName(THEME_STYLE_NAME_HORIZONTAL_SLIDER_THUMB, setHorizontalThumbStyles);
			buttonStyle.setFunctionForStyleName(THEME_STYLE_NAME_VERTICAL_SLIDER_THUMB, setVerticalThumbStyles);
			buttonStyle.setFunctionForStyleName(THEME_STYLE_NAME_HORIZONTAL_SLIDER_MINIMUM_TRACK, setHorizontalSliderMinimumTrackStyles);
			buttonStyle.setFunctionForStyleName(THEME_STYLE_NAME_HORIZONTAL_SLIDER_MAXIMUM_TRACK, setHorizontalSliderMaximumTrackStyles);
			buttonStyle.setFunctionForStyleName(THEME_STYLE_NAME_VERTICAL_SLIDER_MINIMUM_TRACK, setVerticalSliderMinimumTrackStyles);
			buttonStyle.setFunctionForStyleName(THEME_STYLE_NAME_VERTICAL_SLIDER_MAXIMUM_TRACK, setVerticalSliderMaximumTrackStyles);
			
			// Spinner List
			getStyleProviderForClass(SpinnerList).defaultStyleFunction = setSpinnerListStyles;
			dLIRStyle.setFunctionForStyleName(THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER, setSpinnerListItemRendererStyles);
			
			// Tab Bar
			getStyleProviderForClass(TabBar).defaultStyleFunction = setTabBarStyles;
			toggleButtonStyle.setFunctionForStyleName(TabBar.DEFAULT_CHILD_STYLE_NAME_TAB, setTabStyles);
			
			// Text Input
			getStyleProviderForClass(TextInput).defaultStyleFunction = setTextInputStyles;
			getStyleProviderForClass(TextInput).setFunctionForStyleName(TextInput.ALTERNATE_STYLE_NAME_SEARCH_TEXT_INPUT, setSearchTextInputStyles);
			
			// Text Area
			getStyleProviderForClass(TextArea).defaultStyleFunction = setTextAreaStyles;
			getStyleProviderForClass(TextFieldTextEditorViewPort).setFunctionForStyleName(TextArea.DEFAULT_CHILD_STYLE_NAME_TEXT_EDITOR, setTextAreaTextEditorStyles);
			
			// Text Callout
			getStyleProviderForClass(TextCallout).defaultStyleFunction = setTextCalloutStyles;
			
			// Toggle Button
			toggleButtonStyle.defaultStyleFunction = setToggleButtonStyles;
			toggleButtonStyle.setFunctionForStyleName(Button.ALTERNATE_STYLE_NAME_QUIET_BUTTON, setQuietButtonStyles);
			
			// Toggle Switch
			getStyleProviderForClass(ToggleSwitch).defaultStyleFunction = setToggleSwitchStyles;
			buttonStyle.setFunctionForStyleName(ToggleSwitch.DEFAULT_CHILD_STYLE_NAME_ON_TRACK, setToggleSwitchOnTrackStyles);
			buttonStyle.setFunctionForStyleName(ToggleSwitch.DEFAULT_CHILD_STYLE_NAME_OFF_TRACK, setToggleSwitchOffTrackStyles);
			buttonStyle.setFunctionForStyleName(ToggleSwitch.DEFAULT_CHILD_STYLE_NAME_THUMB, setHorizontalThumbStyles);
			toggleButtonStyle.setFunctionForStyleName(ToggleSwitch.DEFAULT_CHILD_STYLE_NAME_THUMB, setHorizontalThumbStyles);
			
			// Tree
			getStyleProviderForClass(Tree).defaultStyleFunction = setTreeStyles;
			getStyleProviderForClass(DefaultTreeItemRenderer).defaultStyleFunction = setTreeItemRendererStyles;
		}
		
		//-------------------------
		// Shared
		//-------------------------
		
		private function setScrollerStyles(scroller:Scroller):void
		{
			scroller.verticalScrollBarFactory = simpleScrollBarFactory;
			scroller.horizontalScrollBarFactory = simpleScrollBarFactory;
		}
		
		private static function simpleScrollBarFactory():SimpleScrollBar { return new SimpleScrollBar(); }
		
		private function setDropDownListStyles(list:List):void
		{
			list.backgroundSkin = new Quad(10, 10, LIST_BACKGROUND);
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.JUSTIFY;
			layout.maxRowCount = 4;
			list.layout = layout;
		}
		
		//-------------------------
		// Alert
		//-------------------------
		
		private function setAlertStyles(alert:Alert):void
		{
			setScrollerStyles(alert);
			
			var backgroundSkin:Image = new Image(popUpBackgroundTexture);
			backgroundSkin.scale9Grid = BACKGROUND_POPUP_SCALE9_GRID;
			alert.backgroundSkin = backgroundSkin;
			
			alert.fontStyles = centeredFontStyles;
			alert.disabledFontStyles = centeredDisabledFontStyles;
			
			alert.padding = alert.gap = gutterSize;
			alert.paddingTop = 0;
			alert.maxWidth = alert.maxHeight = popUpFillSize;
		}
		
		private function setAlertButtonGroupStyles(group:ButtonGroup):void
		{
			group.direction = Direction.HORIZONTAL;
			group.horizontalAlign = HorizontalAlign.CENTER;
			group.verticalAlign = VerticalAlign.JUSTIFY;
			group.distributeButtonSizes = true;
			group.padding = group.gap = gutterSize;
			group.paddingTop = 0;
			group.customLastButtonStyleName = THEME_STYLE_NAME_ALERT_BUTTON_GROUP_LAST_BUTTON;
			group.customButtonStyleName = THEME_STYLE_NAME_ALERT_BUTTON_GROUP_BUTTON;
		}
		
		private function setAlertButtonGroupButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(buttonUpTexture);
			skin.setTextureForState(ButtonState.DOWN, buttonDownTexture);
			skin.setTextureForState(ButtonState.DISABLED, buttonDisabledTexture);
			if (button is ToggleButton)
			{
				skin.selectedTexture = toggleButtonSelectedUpTexture;
				skin.setTextureForState(ButtonState.DISABLED_AND_SELECTED, toggleButtonSelectedDisabledTexture);
			}
			
			skin.scale9Grid = BUTTON_SCALE9_GRID;
			skin.width = skin.height = controlSize;
			skin.minWidth = controlSize * 2;
			skin.minHeight = controlSize;
			button.defaultSkin = skin;
			
			button.fontStyles = darkFontStyles;
			button.disabledFontStyles = darkDisabledFontStyles;
			
			setBaseButtonStyles(button);
		}
		
		//-------------------------
		// Button
		//-------------------------
		
		private function setBaseButtonStyles(button:Button):void
		{
			button.padding = button.gap = smallGutterSize;
			button.paddingRight = button.paddingLeft = gutterSize;
		}
		
		private function setButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(buttonUpTexture);
			skin.setTextureForState(ButtonState.DOWN, buttonDownTexture);
			skin.setTextureForState(ButtonState.DISABLED, buttonDisabledTexture);
			if (button is ToggleButton)
			{
				skin.selectedTexture = toggleButtonSelectedUpTexture;
				skin.setTextureForState(ButtonState.DISABLED_AND_SELECTED, toggleButtonSelectedDisabledTexture);
			}
			
			skin.scale9Grid = BUTTON_SCALE9_GRID;
			skin.width = skin.height = controlSize;
			button.defaultSkin = skin;
			
			button.fontStyles = darkFontStyles;
			button.disabledFontStyles = darkDisabledFontStyles;
			
			setBaseButtonStyles(button);
		}
		
		private function setQuietButtonStyles(button:Button):void
		{
			var downSkin:Image = new Image(quietButtonDownTexture);
			downSkin.scale9Grid = BUTTON_SCALE9_GRID;
			button.setSkinForState(ButtonState.DOWN, downSkin);
			
			var defaultSkin:Quad = new Quad(controlSize, controlSize, 0xff00ff);
			defaultSkin.alpha = 0;
			button.defaultSkin = defaultSkin;
			
			button.fontStyles = darkFontStyles;
			button.disabledFontStyles = darkDisabledFontStyles;
			
			setBaseButtonStyles(button);
		}

		private function setDangerButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(dangerButtonUpTexture);
			skin.setTextureForState(ButtonState.DOWN, dangerButtonDownTexture);
			skin.setTextureForState(ButtonState.DISABLED, dangerButtonDisabledTexture);
			skin.scale9Grid = BUTTON_SCALE9_GRID;
			skin.width = skin.height = controlSize;
			button.defaultSkin = skin;
			
			button.fontStyles = lightFontStyles;
			button.disabledFontStyles = dangerDisabledFontStyles;
			
			setBaseButtonStyles(button);
		}
		
		private function setCallToActionButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(callToActionButtonUpTexture);
			skin.setTextureForState(ButtonState.DOWN, callToActionButtonDownTexture);
			skin.setTextureForState(ButtonState.DISABLED, callToActionButtonDisabledTexture);
			skin.scale9Grid = BUTTON_SCALE9_GRID;
			skin.width = skin.height = controlSize;
			button.defaultSkin = skin;
			
			button.fontStyles = lightFontStyles;
			button.disabledFontStyles = darkDisabledFontStyles;
			
			setBaseButtonStyles(button);
		}
		
		private function setBackButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(backButtonUpTexture);
			skin.setTextureForState(ButtonState.DOWN, backButtonDownTexture);
			skin.setTextureForState(ButtonState.DISABLED, backButtonDisabledTexture);
			skin.scale9Grid = BACK_BUTTON_SCALE9_GRID;
			skin.width = skin.height = controlSize;
			button.defaultSkin = skin;
			
			button.fontStyles = darkFontStyles;
			button.disabledFontStyles = darkDisabledFontStyles;
			
			setBaseButtonStyles(button);
			
			button.paddingLeft = gutterSize + smallGutterSize;
		}
		
		private function setForwardButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(forwardButtonUpTexture);
			skin.setTextureForState(ButtonState.DOWN, forwardButtonDownTexture);
			skin.setTextureForState(ButtonState.DISABLED, forwardButtonDisabledTexture);
			skin.scale9Grid = FORWARD_BUTTON_SCALE9_GRID;
			skin.width = skin.height = controlSize;
			button.defaultSkin = skin;
			
			button.fontStyles = darkFontStyles;
			button.disabledFontStyles = darkDisabledFontStyles;
			
			setBaseButtonStyles(button);
			
			button.paddingRight = gutterSize + smallGutterSize;
		}
		
		//-------------------------
		// ButtonGroup
		//-------------------------
		
		private function setButtonGroupStyles(group:ButtonGroup):void
		{
			group.gap = smallGutterSize;
		}
		
		private function setButtonGroupButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(buttonUpTexture);
			skin.setTextureForState(ButtonState.DOWN, buttonDownTexture);
			skin.setTextureForState(ButtonState.DISABLED, buttonDisabledTexture);
			if (button is ToggleButton)
			{
				skin.selectedTexture = toggleButtonSelectedUpTexture;
				skin.setTextureForState(ButtonState.DISABLED_AND_SELECTED, toggleButtonSelectedDisabledTexture);
			}
			
			skin.scale9Grid = BUTTON_SCALE9_GRID;
			skin.width = skin.minWidth = wideControlSize;
			skin.height = skin.minHeight = controlSize;
			button.defaultSkin = skin;
			
			button.fontStyles = darkFontStyles;
			button.disabledFontStyles = darkDisabledFontStyles;
			
			setBaseButtonStyles(button);
		}
		
		//-------------------------
		// Callout
		//-------------------------
		
		private function setCalloutStyles(callout:Callout):void
		{
			var backgroundSkin:Image = new Image(popUpBackgroundTexture);
			backgroundSkin.scale9Grid = BACKGROUND_POPUP_SCALE9_GRID;
			backgroundSkin.width = backgroundSkin.height = calloutBackgroundMinSize;
			callout.backgroundSkin = backgroundSkin;
			
			var topArrowSkin:Image = new Image(calloutTopArrowTexture);
			callout.topArrowSkin = topArrowSkin;
			callout.topArrowGap = calloutVerticalArrowGap;
			
			var rightArrowSkin:Image = new Image(calloutRightArrowTexture);
			callout.rightArrowSkin = rightArrowSkin;
			callout.rightArrowGap = calloutHorizontalArrowGap;
			
			var bottomArrowSkin:Image = new Image(calloutBottomArrowTexture);
			callout.bottomArrowSkin = bottomArrowSkin;
			callout.bottomArrowGap = calloutVerticalArrowGap;
			
			var leftArrowSkin:Image = new Image(calloutLeftArrowTexture);
			callout.leftArrowSkin = leftArrowSkin;
			callout.leftArrowGap = calloutHorizontalArrowGap;
			
			callout.padding = gutterSize;
		}
		
		//-------------------------
		// Check
		//-------------------------
		
		private function setCheckStyles(check:Check):void
		{
			var icon:ImageSkin = new ImageSkin(checkUpIconTexture);
			icon.selectedTexture = checkSelectedUpIconTexture;
			icon.setTextureForState(ButtonState.DOWN, checkDownIconTexture);
			icon.setTextureForState(ButtonState.DISABLED, checkDisabledIconTexture);
			icon.setTextureForState(ButtonState.DOWN_AND_SELECTED, checkSelectedDownIconTexture);
			icon.setTextureForState(ButtonState.DISABLED_AND_SELECTED, checkSelectedDisabledIconTexture);
			check.defaultIcon = icon;
			
			check.fontStyles = darkFontStyles;
			check.disabledFontStyles = darkDisabledFontStyles;
			
			check.gap = smallGutterSize;
		}
		
		//-------------------------
		// DateTimeSpinner
		//-------------------------
		
		private function setDateTimeSpinnerStyles(spinner:DateTimeSpinner):void
		{
			spinner.customItemRendererStyleName = THEME_STYLE_NAME_DATE_TIME_SPINNER_LIST_ITEM_RENDERER;
		}
		
		private function setDateTimeSpinnerListItemRendererStyles(itemRenderer:DefaultListItemRenderer):void
		{
			setSpinnerListItemRendererStyles(itemRenderer);
			
			itemRenderer.paddingLeft = itemRenderer.paddingRight = smallGutterSize;
			itemRenderer.gap = itemRenderer.minGap = itemRenderer.accessoryGap = itemRenderer.minAccessoryGap = extraSmallGutterSize;
			itemRenderer.accessoryPosition = RelativePosition.LEFT;
		}
		
		//-------------------------
		// Drawers
		//-------------------------
		
		private function setDrawersStyles(drawers:Drawers):void
		{
			var overlaySkin:Quad = new Quad(10, 10, COLOR_OVERLAY);
			overlaySkin.alpha = ALPHA_OVERLAY;
			drawers.overlaySkin = overlaySkin;
			
			drawers.topDrawerDivider = new Quad(borderSize, borderSize, COLOR_DRAWERS_DIVIDER);
			drawers.rightDrawerDivider = new Quad(borderSize, borderSize, COLOR_DRAWERS_DIVIDER);
			drawers.bottomDrawerDivider = new Quad(borderSize, borderSize, COLOR_DRAWERS_DIVIDER);
			drawers.leftDrawerDivider = new Quad(borderSize, borderSize, COLOR_DRAWERS_DIVIDER);
		}
		
		//-------------------------
		// GroupedList
		//-------------------------
		
		private function setGroupedListStyles(list:GroupedList):void
		{
			setScrollerStyles(list);
			list.backgroundSkin = new Quad(10, 10, LIST_BACKGROUND);
			list.customFirstItemRendererStyleName = THEME_STYLE_NAME_GROUPED_LIST_FIRST_ITEM_RENDERER;
		}
		
		private function setInsetGroupedListStyles(list:GroupedList):void
		{
			setGroupedListStyles(list);
			list.customHeaderRendererStyleName = GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_HEADER_RENDERER;
			list.customFooterRendererStyleName = GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_FOOTER_RENDERER;
		}
		
		private function setGroupedListFirstItemRendererStyles(itemRenderer:BaseDefaultItemRenderer):void
		{
			var skin:ImageSkin = new ImageSkin(firstItemRendererUpTexture);
			skin.selectedTexture = itemRendererSelectedTexture;
			skin.setTextureForState(ButtonState.DOWN, itemRendererDownTexture);
			skin.scale9Grid = LIST_ITEM_SCALE9_GRID;
			skin.width = skin.height = controlSize;
			itemRenderer.defaultSkin = skin;
			
			itemRenderer.fontStyles = darkFontStyles;
			itemRenderer.disabledFontStyles = darkDisabledFontStyles;
			
			itemRenderer.iconLabelFontStyles = itemRenderer.accessoryLabelFontStyles = smallDarkFontStyles;
			itemRenderer.iconLabelDisabledFontStyles = itemRenderer.accessoryLabelDisabledFontStyles = smallDisabledFontStyles;
			
			setBaseItemRendererStyles(itemRenderer);
		}
		
		private function setGroupedListHeaderRendererStyles(headerRenderer:DefaultGroupedListHeaderOrFooterRenderer):void
		{
			var backgroundSkin:Image = new Image(groupedListHeaderTexture);
			backgroundSkin.scale9Grid = GROUPED_LIST_HEADER_OR_FOOTER_SCALE9_GRID;
			headerRenderer.backgroundSkin = backgroundSkin;
			
			headerRenderer.fontStyles = smallDarkFontStyles;
			headerRenderer.disabledFontStyles = smallDisabledFontStyles;
			
			headerRenderer.horizontalAlign = HorizontalAlign.LEFT;
			headerRenderer.padding = smallGutterSize;
			headerRenderer.paddingRight = headerRenderer.paddingLeft = gutterSize;
		}
		
		private function setGroupedListInsetHeaderRendererStyles(headerRenderer:DefaultGroupedListHeaderOrFooterRenderer):void
		{
			headerRenderer.fontStyles = smallDarkFontStyles;
			headerRenderer.disabledFontStyles = smallDisabledFontStyles;
			
			headerRenderer.horizontalAlign = HorizontalAlign.LEFT;
			headerRenderer.padding = gutterSize;
			headerRenderer.paddingBottom = smallGutterSize;
		}
		
		private function setGroupedListFooterRendererStyles(footerRenderer:DefaultGroupedListHeaderOrFooterRenderer):void
		{
			var backgroundSkin:Image = new Image(groupedListFooterTexture);
			backgroundSkin.scale9Grid = GROUPED_LIST_HEADER_OR_FOOTER_SCALE9_GRID;
			footerRenderer.backgroundSkin = backgroundSkin;
			
			footerRenderer.fontStyles = smallDarkFontStyles;
			footerRenderer.disabledFontStyles = smallDisabledFontStyles;
			
			footerRenderer.horizontalAlign = HorizontalAlign.CENTER;
			footerRenderer.padding = smallGutterSize;
			footerRenderer.paddingRight = footerRenderer.paddingLeft = gutterSize;
		}
		
		private function setGroupedListInsetFooterRendererStyles(footerRenderer:DefaultGroupedListHeaderOrFooterRenderer):void
		{
			footerRenderer.fontStyles = darkFontStyles;
			footerRenderer.disabledFontStyles = darkDisabledFontStyles;
			
			footerRenderer.horizontalAlign = HorizontalAlign.LEFT;
			footerRenderer.padding = gutterSize;
			footerRenderer.paddingTop = smallGutterSize;
		}
		
		//-------------------------
		// Header
		//-------------------------
		
		private function setHeaderStyles(header:Header):void
		{
			setHeaderWithoutBackgroundStyles(header);
			
			header.fontStyles = largeDarkFontStyles;
			header.disabledFontStyles = largeDisabledFontStyles;
			
			var backgroundSkin:Image = new Image(headerBackgroundSkinTexture);
			backgroundSkin.scale9Grid = HEADER_BACKGROUND_SCALE9_GRID;
			backgroundSkin.width = backgroundSkin.height = gridSize;
			header.backgroundSkin = backgroundSkin;
		}
		
		//-------------------------
		// Label
		//-------------------------
		
		private function setLabelStyles(label:Label):void
		{
			label.fontStyles = darkFontStyles;
			label.disabledFontStyles = darkDisabledFontStyles;
		}
		
		private function setHeadingLabelStyles(label:Label):void
		{
			label.fontStyles = largeDarkFontStyles;
			label.disabledFontStyles = largeDisabledFontStyles;
		}
		
		private function setDetailLabelStyles(label:Label):void
		{
			label.fontStyles = smallDarkFontStyles;
			label.disabledFontStyles = smallDisabledFontStyles;
		}
		
		//-------------------------
		// LayoutGroup
		//-------------------------
		
		private function setToolbarLayoutGroupStyles(group:LayoutGroup):void
		{
			if (!group.layout)
			{
				var layout:HorizontalLayout = new HorizontalLayout();
				layout.padding = layout.gap = smallGutterSize;
				group.layout = layout;
			}
			
			group.backgroundSkin = new Quad(controlSize, controlSize, BACKGROUND);
		}
		
		//-------------------------
		// List
		//-------------------------
		
		private function setListStyles(list:List):void
		{
			setScrollerStyles(list);
			list.backgroundSkin = new Quad(10, 10, LIST_BACKGROUND);
		}
		
		private function setBaseItemRendererStyles(itemRenderer:BaseDefaultItemRenderer):void
		{
			itemRenderer.horizontalAlign = HorizontalAlign.LEFT;
			itemRenderer.padding = smallGutterSize;
			itemRenderer.paddingRight = itemRenderer.paddingLeft = gutterSize;
			itemRenderer.gap = itemRenderer.minGap = itemRenderer.minAccessoryGap = gutterSize;
			itemRenderer.iconPosition = RelativePosition.LEFT;
			itemRenderer.accessoryGap = Number.POSITIVE_INFINITY;
			itemRenderer.accessoryPosition = RelativePosition.RIGHT;
			itemRenderer.minTouchWidth = itemRenderer.minTouchHeight = controlSize;
		}
		
		private function setItemRendererStyles(itemRenderer:BaseDefaultItemRenderer):void
		{
			var skin:ImageSkin = new ImageSkin(itemRendererUpTexture);
			skin.selectedTexture = itemRendererSelectedTexture;
			skin.setTextureForState(ButtonState.DOWN, itemRendererDownTexture);
			skin.scale9Grid = LIST_ITEM_SCALE9_GRID;
			skin.width = skin.height = skin.minWidth = skin.minHeight = controlSize;
			itemRenderer.defaultSkin = skin;
			
			itemRenderer.fontStyles = darkFontStyles;
			itemRenderer.disabledFontStyles = darkDisabledFontStyles;
			
			itemRenderer.iconLabelFontStyles = itemRenderer.accessoryLabelFontStyles = smallDarkFontStyles;
			itemRenderer.iconLabelDisabledFontStyles = itemRenderer.accessoryLabelDisabledFontStyles = smallDisabledFontStyles;
			
			setBaseItemRendererStyles(itemRenderer);
		}
		
		//-------------------------
		// NumericStepper
		//-------------------------
		
		private function setNumericStepperStyles(stepper:NumericStepper):void
		{
			stepper.buttonLayoutMode = StepperButtonLayoutMode.SPLIT_HORIZONTAL;
			stepper.incrementButtonLabel = "+";
			stepper.decrementButtonLabel = "-";
		}
		
		private function setNumericStepperTextInputStyles(input:TextInput):void
		{
			var skin:ImageSkin = new ImageSkin(textInputBackgroundEnabledTexture);
			skin.disabledTexture = textInputBackgroundDisabledTexture;
			skin.scale9Grid = TEXT_INPUT_SCALE9_GRID;
			skin.width = skin.height = skin.minWidth = skin.minHeight = controlSize;
			input.backgroundSkin = skin;
			
			input.textEditorFactory = stepperTextEditorFactory;
			input.fontStyles = centeredFontStyles;
			input.disabledFontStyles = centeredDisabledFontStyles;
			
			input.padding = smallGutterSize;
			input.isEditable = false;
			input.isSelectable = false;
		}
		
		private static function stepperTextEditorFactory():TextBlockTextEditor { return new TextBlockTextEditor(); }
		
		private function setNumericStepperButtonStyles(button:Button):void
		{
			setQuietButtonStyles(button);
			
			button.keepDownStateOnRollOut = true;
			
			button.fontStyles = largeDarkFontStyles;
			button.disabledFontStyles = largeDisabledFontStyles;
		}
		
		//-------------------------
		// PageIndicator
		//-------------------------
		
		private function setPageIndicatorStyles(pageIndicator:PageIndicator):void
		{
			pageIndicator.normalSymbolFactory = pageIndicatorNormalSymbolFactory;
			pageIndicator.selectedSymbolFactory = pageIndicatorSelectedSymbolFactory;
			pageIndicator.gap = pageIndicator.padding = gutterSize;
			pageIndicator.minTouchWidth = pageIndicator.minTouchHeight = controlSize;
		}
		
		private function pageIndicatorNormalSymbolFactory():DisplayObject
		{
			var symbol:ImageLoader = new ImageLoader();
			symbol.source = pageIndicatorNormalTexture;
			return symbol;
		}
		
		private function pageIndicatorSelectedSymbolFactory():DisplayObject
		{
			var symbol:ImageLoader = new ImageLoader();
			symbol.source = pageIndicatorSelectedTexture;
			return symbol;
		}
		
		//-------------------------
		// Panel
		//-------------------------
		
		private function setPanelStyles(panel:Panel):void
		{
			setScrollerStyles(panel);
			
			var backgroundSkin:Image = new Image(popUpBackgroundTexture);
			backgroundSkin.scale9Grid = BACKGROUND_POPUP_SCALE9_GRID;
			panel.backgroundSkin = backgroundSkin;
			
			panel.padding = smallGutterSize;
		}
		
		private function setHeaderWithoutBackgroundStyles(header:Header):void
		{
			header.fontStyles = largeDarkFontStyles;
			header.disabledFontStyles = largeDisabledFontStyles;
			
			header.gap = gutterSize;
			header.padding = header.titleGap = smallGutterSize;
			header.minHeight = gridSize;
		}
		
		//-------------------------
		// PanelScreen
		//-------------------------
		
		private function setPanelScreenStyles(screen:PanelScreen):void
		{
			setScrollerStyles(screen);
		}
		
		private function setPanelScreenHeaderStyles(header:Header):void
		{
			setHeaderStyles(header);
			
			header.useExtraPaddingForOSStatusBar = true;
		}
		
		//-------------------------
		// PickerList
		//-------------------------
		
		private function setPickerListStyles(list:PickerList):void
		{
			if (DeviceCapabilities.isPhone(starling.nativeStage))
			{
				list.listFactory = spinnerListFactory;
				
				var popUpContentManager:BottomDrawerPopUpContentManager = new BottomDrawerPopUpContentManager();
				popUpContentManager.customPanelStyleName = THEME_STYLE_NAME_POP_UP_DRAWER;
				list.popUpContentManager = popUpContentManager;
			}
			else
			{
				list.popUpContentManager = new CalloutPopUpContentManager();
				list.customItemRendererStyleName = THEME_STYLE_NAME_TABLET_PICKER_LIST_ITEM_RENDERER;
			}
		}
		
		private static function spinnerListFactory():SpinnerList { return new SpinnerList(); }
		
		private function setPickerListButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(buttonUpTexture);
			skin.setTextureForState(ButtonState.DOWN, buttonDownTexture);
			skin.setTextureForState(ButtonState.DISABLED, buttonDisabledTexture);
			skin.scale9Grid = BUTTON_SCALE9_GRID;
			skin.width = skin.height = controlSize;
			button.defaultSkin = skin;
			
			var icon:ImageSkin = new ImageSkin(pickerListButtonIcon);
			icon.disabledTexture = pickerListButtonDisabledIcon;
			button.defaultIcon = icon;
			
			button.fontStyles = darkFontStyles;
			button.disabledFontStyles = darkDisabledFontStyles;
			
			setBaseButtonStyles(button);
			
			button.gap = Number.POSITIVE_INFINITY;
			button.minGap = button.paddingLeft = gutterSize;
			button.iconPosition = RelativePosition.RIGHT;
		}
		
		private function setPickerListListStyles(list:List):void
		{
			setDropDownListStyles(list);
		}
		
		private function setTabletPickerListItemRendererStyles(itemRenderer:BaseDefaultItemRenderer):void
		{
			var skin:ImageSkin = new ImageSkin(itemRendererUpTexture);
			skin.selectedTexture = itemRendererSelectedTexture;
			skin.setTextureForState(ButtonState.DOWN, itemRendererDownTexture);
			skin.scale9Grid = LIST_ITEM_SCALE9_GRID;
			skin.width = skin.height = skin.minHeight = controlSize;
			skin.minWidth = popUpFillSize;
			itemRenderer.defaultSkin = skin;
			
			itemRenderer.fontStyles = darkFontStyles;
			itemRenderer.disabledFontStyles = darkDisabledFontStyles;
			
			itemRenderer.iconLabelFontStyles = itemRenderer.accessoryLabelFontStyles = smallDarkFontStyles;
			itemRenderer.iconLabelDisabledFontStyles = itemRenderer.accessoryLabelDisabledFontStyles = smallDisabledFontStyles;
			
			setBaseItemRendererStyles(itemRenderer);
		}
		
		private function setPickerListPopUpDrawerStyles(panel:Panel):void
		{
			setScrollerStyles(panel);
			
			panel.customHeaderStyleName = THEME_STYLE_NAME_POP_UP_DRAWER_HEADER;
			
			var backgroundSkin:Image = new Image(popUpDrawerBackgroundTexture);
			backgroundSkin.scale9Grid = POP_UP_DRAWER_BACKGROUND_SCALE9_GRID;
			panel.backgroundSkin = backgroundSkin;
			
			panel.outerPaddingTop = shadowSize;
		}
		
		//-------------------------
		// ProgressBar
		//-------------------------
		
		private function setProgressBarStyles(progress:ProgressBar):void
		{
			var backgroundSkin:Image;
			var backgroundDisabledSkin:Image;
			if (progress.direction === Direction.HORIZONTAL)
			{
				backgroundSkin = new Image(horizontalProgressBarBackgroundTexture);
				backgroundSkin.scale9Grid = BAR_HORIZONTAL_SCALE9_GRID;
				backgroundSkin.width = wideControlSize;
				backgroundSkin.height = smallControlSize;
				backgroundDisabledSkin = new Image(horizontalProgressBarBackgroundDisabledTexture);
				backgroundDisabledSkin.scale9Grid = BAR_HORIZONTAL_SCALE9_GRID;
				backgroundDisabledSkin.width = wideControlSize;
				backgroundDisabledSkin.height = smallControlSize;
			}
			else
			{
				backgroundSkin = new Image(verticalProgressBarBackgroundTexture);
				backgroundSkin.scale9Grid = BAR_VERTICAL_SCALE9_GRID;
				backgroundSkin.width = smallControlSize;
				backgroundSkin.height = wideControlSize;
				backgroundDisabledSkin = new Image(verticalProgressBarBackgroundDisabledTexture);
				backgroundDisabledSkin.scale9Grid = BAR_VERTICAL_SCALE9_GRID;
				backgroundDisabledSkin.width = smallControlSize;
				backgroundDisabledSkin.height = wideControlSize;
			}
			
			progress.backgroundSkin = backgroundSkin;
			progress.backgroundDisabledSkin = backgroundDisabledSkin;
			
			var fillSkin:Image;
			var fillDisabledSkin:Image;
			if (progress.direction === Direction.HORIZONTAL)
			{
				fillSkin = new Image(horizontalProgressBarFillTexture);
				fillSkin.scale9Grid = BAR_HORIZONTAL_SCALE9_GRID;
				fillSkin.width = fillSkin.height = smallControlSize;
				fillDisabledSkin = new Image(horizontalProgressBarFillDisabledTexture);
				fillDisabledSkin.scale9Grid = BAR_HORIZONTAL_SCALE9_GRID;
				fillDisabledSkin.width = fillDisabledSkin.height = smallControlSize;
			}
			else
			{
				fillSkin = new Image(verticalProgressBarFillTexture);
				fillSkin.scale9Grid = BAR_VERTICAL_SCALE9_GRID;
				fillSkin.width = fillSkin.height = smallControlSize;
				fillDisabledSkin = new Image(verticalProgressBarFillDisabledTexture);
				fillDisabledSkin.scale9Grid = BAR_VERTICAL_SCALE9_GRID;
				fillDisabledSkin.width = fillDisabledSkin.height = smallControlSize;
			}
			
			progress.fillSkin = fillSkin;
			progress.fillDisabledSkin = fillDisabledSkin;
		}
		
		//-------------------------
		// Radio
		//-------------------------
		
		private function setRadioStyles(radio:Radio):void
		{
			var icon:ImageSkin = new ImageSkin(radioUpIconTexture);
			icon.selectedTexture = radioSelectedUpIconTexture;
			icon.setTextureForState(ButtonState.DOWN, radioDownIconTexture);
			icon.setTextureForState(ButtonState.DISABLED, radioDisabledIconTexture);
			icon.setTextureForState(ButtonState.DOWN_AND_SELECTED, radioSelectedDownIconTexture);
			icon.setTextureForState(ButtonState.DISABLED_AND_SELECTED, radioSelectedDisabledIconTexture);
			radio.defaultIcon = icon;
			
			radio.fontStyles = darkFontStyles;
			radio.disabledFontStyles = darkDisabledFontStyles;
			
			radio.gap = smallGutterSize;
		}
		
		//-------------------------
		// ScrollContainer
		//-------------------------
		
		private function setScrollContainerStyles(container:ScrollContainer):void
		{
			setScrollerStyles(container);
		}
		
		private function setToolbarScrollContainerStyles(container:ScrollContainer):void
		{
			setScrollerStyles(container);
			if (!container.layout)
			{
				var layout:HorizontalLayout = new HorizontalLayout();
				layout.padding = layout.gap = smallGutterSize;
				container.layout = layout;
			}
			
			container.backgroundSkin = new Quad(controlSize, controlSize, BACKGROUND);
		}
		
		//-------------------------
		// ScrollText
		//-------------------------
		
		private function setScrollTextStyles(text:ScrollText):void
		{
			setScrollerStyles(text);
			
			var skin:ImageSkin = new ImageSkin(textInputBackgroundEnabledTexture);
			skin.disabledTexture = textInputBackgroundDisabledTexture;
			skin.scale9Grid = TEXT_INPUT_SCALE9_GRID;
			skin.width = skin.minWidth = wideControlSize;
			skin.height = skin.minHeight = controlSize;
			text.backgroundSkin = skin;
			
			text.fontStyles = darkScrollTextFontStyles;
			text.disabledFontStyles = darkScrollTextDisabledFontStyles;
			
			text.padding = gutterSize;
			text.paddingRight = gutterSize + smallGutterSize;
		}
		
		//-------------------------
		// SimpleScrollBar
		//-------------------------
		
		private function setSimpleScrollBarStyles(scrollBar:SimpleScrollBar):void
		{
			if (scrollBar.direction === Direction.HORIZONTAL)
			{
				scrollBar.customThumbStyleName = THEME_STYLE_NAME_HORIZONTAL_SIMPLE_SCROLL_BAR_THUMB;
			}
			else
			{
				scrollBar.customThumbStyleName = THEME_STYLE_NAME_VERTICAL_SIMPLE_SCROLL_BAR_THUMB;
			}
			
			scrollBar.padding = extraSmallGutterSize;
			scrollBar.paddingLeft = 0;
		}
		
		private function setHorizontalSimpleScrollBarThumbStyles(thumb:Button):void
		{
			var defaultSkin:Image = new Image(horizontalSimpleScrollBarThumbTexture);
			defaultSkin.scale9Grid = HORIZONTAL_SIMPLE_SCROLL_BAR_SCALE9_GRID;
			thumb.defaultSkin = defaultSkin;
			
			thumb.hasLabelTextRenderer = false;
		}
		
		private function setVerticalSimpleScrollBarThumbStyles(thumb:Button):void
		{
			var defaultSkin:Image = new Image(verticalSimpleScrollBarThumbTexture);
			defaultSkin.scale9Grid = VERTICAL_SIMPLE_SCROLL_BAR_SCALE9_GRID;
			thumb.defaultSkin = defaultSkin;
			
			thumb.hasLabelTextRenderer = false;
		}
		
		//-------------------------
		// SpinnerList
		//-------------------------
		
		private function setSpinnerListStyles(list:SpinnerList):void
		{
			list.verticalScrollPolicy = ScrollPolicy.ON;
			list.backgroundSkin = new Quad(controlSize, controlSize, LIST_BACKGROUND);
			var selectionOverlaySkin:Image = new Image(spinnerListSelectionOverlayTexture);
			selectionOverlaySkin.scale9Grid = SPINNER_LIST_OVERLAY_SCALE9_GRID;
			list.selectionOverlaySkin = selectionOverlaySkin;
			list.customItemRendererStyleName = THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER;
		}
		
		private function setSpinnerListItemRendererStyles(itemRenderer:DefaultListItemRenderer):void
		{
			var defaultSkin:Quad = new Quad(gridSize, gridSize, 0xff00ff);
			defaultSkin.alpha = 0;
			itemRenderer.defaultSkin = defaultSkin;
			
			itemRenderer.fontStyles = darkFontStyles;
			itemRenderer.disabledFontStyles = darkDisabledFontStyles;
			itemRenderer.selectedFontStyles = selectedFontStyles;
			
			itemRenderer.iconLabelFontStyles = itemRenderer.accessoryLabelFontStyles = smallDarkFontStyles;
			itemRenderer.iconLabelDisabledFontStyles = itemRenderer.accessoryLabelDisabledFontStyles = smallDisabledFontStyles;
			itemRenderer.iconLabelSelectedFontStyles = itemRenderer.accessoryLabelSelectedFontStyles = smallSelectedFontStyles;
			
			itemRenderer.horizontalAlign = HorizontalAlign.LEFT;
			itemRenderer.padding = smallGutterSize;
			itemRenderer.paddingLeft = itemRenderer.paddingRight = gutterSize;
			itemRenderer.gap = itemRenderer.minGap = itemRenderer.minAccessoryGap = smallGutterSize;
			itemRenderer.iconPosition = RelativePosition.LEFT;
			itemRenderer.accessoryGap = Number.POSITIVE_INFINITY;
			itemRenderer.accessoryPosition = RelativePosition.RIGHT;
		}
		
		//-------------------------
		// Slider
		//-------------------------
		
		private function setSliderStyles(slider:Slider):void
		{
			slider.trackLayoutMode = TrackLayoutMode.SPLIT;
			if (slider.direction === Direction.VERTICAL)
			{
				slider.customThumbStyleName = THEME_STYLE_NAME_VERTICAL_SLIDER_THUMB;
				slider.customMinimumTrackStyleName = THEME_STYLE_NAME_VERTICAL_SLIDER_MINIMUM_TRACK;
				slider.customMaximumTrackStyleName = THEME_STYLE_NAME_VERTICAL_SLIDER_MAXIMUM_TRACK;
			}
			else
			{
				slider.customThumbStyleName = THEME_STYLE_NAME_HORIZONTAL_SLIDER_THUMB;
				slider.customMinimumTrackStyleName = THEME_STYLE_NAME_HORIZONTAL_SLIDER_MINIMUM_TRACK;
				slider.customMaximumTrackStyleName = THEME_STYLE_NAME_HORIZONTAL_SLIDER_MAXIMUM_TRACK;
			}
		}
		
		private function setHorizontalSliderMinimumTrackStyles(track:Button):void
		{
			var skin:ImageSkin = new ImageSkin(horizontalSliderMinimumTrackTexture);
			skin.setTextureForState(ButtonState.DISABLED, horizontalSliderMinimumTrackDisabledTexture);
			skin.scale9Grid = HORIZONTAL_MINIMUM_TRACK_SCALE9_GRID;
			skin.width = wideControlSize - thumbSize / 2;
			skin.height = smallControlSize;
			track.defaultSkin = skin;
			
			track.hasLabelTextRenderer = false;
		}
		
		private function setHorizontalSliderMaximumTrackStyles(track:Button):void
		{
			var skin:ImageSkin = new ImageSkin(horizontalSliderMaximumTrackTexture);
			skin.setTextureForState(ButtonState.DISABLED, horizontalSliderMaximumTrackDisabledTexture);
			skin.scale9Grid = HORIZONTAL_MAXIMUM_TRACK_SCALE9_GRID;
			skin.width = wideControlSize - thumbSize / 2;
			skin.height = smallControlSize;
			track.defaultSkin = skin;
			
			track.hasLabelTextRenderer = false;
		}
		
		private function setVerticalSliderMinimumTrackStyles(track:Button):void
		{
			var skin:ImageSkin = new ImageSkin(verticalSliderMinimumTrackTexture);
			skin.setTextureForState(ButtonState.DISABLED, verticalSliderMinimumTrackDisabledTexture);
			skin.scale9Grid = VERTICAL_MINIMUM_TRACK_SCALE9_GRID;
			skin.width = smallControlSize;
			skin.height = wideControlSize - thumbSize / 2;
			track.defaultSkin = skin;
			track.hasLabelTextRenderer = false;
		}
		
		private function setVerticalSliderMaximumTrackStyles(track:Button):void
		{
			var skin:ImageSkin = new ImageSkin(verticalSliderMaximumTrackTexture);
			skin.setTextureForState(ButtonState.DISABLED, verticalSliderMaximumTrackDisabledTexture);
			skin.scale9Grid = VERTICAL_MAXIMUM_TRACK_SCALE9_GRID;
			skin.width = smallControlSize;
			skin.height = wideControlSize - thumbSize / 2;
			track.defaultSkin = skin;
			track.hasLabelTextRenderer = false;
		}
		
		//-------------------------
		// TabBar
		//-------------------------
		
		private function setTabBarStyles(tabBar:TabBar):void
		{
			tabBar.distributeTabSizes = true;
		}
		
		private function setTabStyles(tab:ToggleButton):void
		{
			var skin:ImageSkin = new ImageSkin(tabUpTexture);
			skin.selectedTexture = tabSelectedUpTexture;
			skin.setTextureForState(ButtonState.DOWN, tabDownTexture);
			skin.setTextureForState(ButtonState.DISABLED_AND_SELECTED, tabSelectedDisabledTexture);
			skin.scale9Grid = TAB_SCALE9_GRID;
			skin.width = skin.minWidth = controlSize;
			skin.height = skin.minHeight = gridSize;
			tab.defaultSkin = skin;
			
			tab.fontStyles = darkFontStyles;
			tab.disabledFontStyles = darkDisabledFontStyles;
			tab.selectedFontStyles = selectedFontStyles;
			tab.setFontStylesForState(ButtonState.DISABLED_AND_SELECTED, selectedDisabledFontStyles);
			
			tab.paddingLeft = tab.paddingRight = gutterSize;
		}
		
		//-------------------------
		// TextArea
		//-------------------------
		
		private function setTextAreaStyles(textArea:TextArea):void
		{
			setScrollerStyles(textArea);
			
			var skin:ImageSkin = new ImageSkin(textInputBackgroundEnabledTexture);
			skin.disabledTexture = textInputBackgroundDisabledTexture;
			skin.setTextureForState(TextInputState.FOCUSED, textInputBackgroundFocusedTexture);
			skin.setTextureForState(TextInputState.ERROR, textInputBackgroundErrorTexture);
			skin.scale9Grid = TEXT_INPUT_SCALE9_GRID;
			skin.width = skin.height = wideControlSize;
			textArea.backgroundSkin = skin;
			
			textArea.fontStyles = darkScrollTextFontStyles;
			textArea.disabledFontStyles = darkScrollTextDisabledFontStyles;
			
			textArea.textEditorFactory = textAreaTextEditorFactory;
		}
		
		private static function textAreaTextEditorFactory():TextFieldTextEditorViewPort { return new TextFieldTextEditorViewPort(); }
		
		private function setTextAreaTextEditorStyles(textEditor:TextFieldTextEditorViewPort):void
		{
			textEditor.padding = smallGutterSize;
		}
		
		//-------------------------
		// TextCallout
		//-------------------------
		
		private function setTextCalloutStyles(callout:TextCallout):void
		{
			setCalloutStyles(callout);
			
			callout.fontStyles = darkFontStyles;
			callout.disabledFontStyles = darkDisabledFontStyles;
		}
		
		//-------------------------
		// TextInput
		//-------------------------
		
		private function setBaseTextInputStyles(input:TextInput):void
		{
			input.padding = input.gap = smallGutterSize;
			input.paddingRight = input.paddingLeft = gutterSize;
		}
		
		private function setTextInputStyles(input:TextInput):void
		{
			var skin:ImageSkin = new ImageSkin(textInputBackgroundEnabledTexture);
			skin.disabledTexture = textInputBackgroundDisabledTexture;
			skin.setTextureForState(TextInputState.FOCUSED, textInputBackgroundFocusedTexture);
			skin.setTextureForState(TextInputState.ERROR, textInputBackgroundErrorTexture);
			skin.scale9Grid = TEXT_INPUT_SCALE9_GRID;
			skin.width = skin.minWidth = wideControlSize;
			skin.height = skin.minHeight = controlSize;
			input.backgroundSkin = skin;
			
			input.fontStyles = darkScrollTextFontStyles;
			input.disabledFontStyles = darkScrollTextDisabledFontStyles;
			
			input.promptFontStyles = darkFontStyles;
			input.promptDisabledFontStyles = darkDisabledFontStyles;
			
			setBaseTextInputStyles(input);
		}
		
		private function setSearchTextInputStyles(input:TextInput):void
		{
			var skin:ImageSkin = new ImageSkin(searchTextInputBackgroundEnabledTexture);
			skin.disabledTexture = searchTextInputBackgroundDisabledTexture;
			skin.setTextureForState(TextInputState.FOCUSED, searchTextInputBackgroundFocusedTexture);
			skin.scale9Grid = SEARCH_INPUT_SCALE9_GRID;
			skin.width = skin.minWidth = wideControlSize;
			skin.height = skin.minHeight = controlSize;
			input.backgroundSkin = skin;
			
			var icon:Image = new Image(searchIconTexture);
			input.defaultIcon = icon;
			
			input.fontStyles = darkScrollTextFontStyles;
			input.disabledFontStyles = darkScrollTextDisabledFontStyles;
			
			input.promptFontStyles = darkFontStyles;
			input.promptDisabledFontStyles = darkDisabledFontStyles;
			
			setBaseTextInputStyles(input);
		}
		
		//-------------------------
		// ToggleButton
		//-------------------------
		
		private function setToggleButtonStyles(button:ToggleButton):void
		{
			setButtonStyles(button);
			
			button.fontStyles = darkFontStyles;
			button.disabledFontStyles = darkDisabledFontStyles;
			button.selectedFontStyles = selectedFontStyles;
			button.setFontStylesForState(ButtonState.DISABLED_AND_SELECTED, selectedDisabledFontStyles);
		}
		
		//-------------------------
		// ToggleSwitch
		//-------------------------
		
		private function setToggleSwitchStyles(toggle:ToggleSwitch):void
		{
			toggle.offLabelFontStyles = toggle.onLabelFontStyles = darkFontStyles;
			toggle.offLabelDisabledFontStyles = toggle.onLabelDisabledFontStyles = darkDisabledFontStyles;
			toggle.trackLayoutMode = TrackLayoutMode.SPLIT;
		}
		
		private function setToggleSwitchOnTrackStyles(track:Button):void
		{
			var skin:ImageSkin = new ImageSkin(toggleSwitchOnTrackTexture);
			skin.disabledTexture = toggleSwitchOnTrackDisabledTexture;
			skin.scale9Grid = BUTTON_SCALE9_GRID;
			skin.width = gridSize;
			skin.height = controlSize;
			track.defaultSkin = skin;
			track.hasLabelTextRenderer = false;
		}
		
		private function setToggleSwitchOffTrackStyles(track:Button):void
		{
			var skin:ImageSkin = new ImageSkin(toggleSwitchOffTrackTexture);
			skin.disabledTexture = toggleSwitchOffTrackDisabledTexture;
			skin.scale9Grid = BUTTON_SCALE9_GRID;
			skin.width = gridSize;
			skin.height = controlSize;
			track.defaultSkin = skin;
			track.hasLabelTextRenderer = false;
		}
		
		private function setHorizontalThumbStyles(thumb:Button):void
		{
			var skin:ImageSkin = new ImageSkin(buttonUpTexture);
			skin.setTextureForState(ButtonState.DISABLED, buttonDisabledTexture);
			skin.scale9Grid = BUTTON_SCALE9_GRID;
			skin.width = thumbSize;
			skin.height = controlSize;
			thumb.defaultSkin = skin;
			thumb.hasLabelTextRenderer = false;
		}
		
		private function setVerticalThumbStyles(thumb:Button):void
		{
			var skin:ImageSkin = new ImageSkin(buttonUpTexture);
			skin.setTextureForState(ButtonState.DISABLED, buttonDisabledTexture);
			skin.scale9Grid = BUTTON_SCALE9_GRID;
			skin.width = controlSize;
			skin.height = thumbSize;
			thumb.defaultSkin = skin;
			thumb.hasLabelTextRenderer = false;
		}
		
		//-------------------------
		// Tree
		//-------------------------
		
		private function setTreeStyles(tree:Tree):void
		{
			setScrollerStyles(tree);
			tree.backgroundSkin = new Quad(10, 10, LIST_BACKGROUND);
		}
		
		private function setTreeItemRendererStyles(itemRenderer:DefaultTreeItemRenderer):void
		{
			setItemRendererStyles(itemRenderer);
			itemRenderer.indentation = treeDisclosureOpenIconTexture.width;
			
			var disclosureOpenIcon:ImageSkin = new ImageSkin(treeDisclosureOpenIconTexture);
			disclosureOpenIcon.minTouchWidth = disclosureOpenIcon.minTouchHeight = gridSize;
			itemRenderer.disclosureOpenIcon = disclosureOpenIcon;
			
			var disclosureClosedIcon:ImageSkin = new ImageSkin(treeDisclosureClosedIconTexture);
			disclosureClosedIcon.minTouchWidth = disclosureClosedIcon.minTouchHeight = gridSize
			itemRenderer.disclosureClosedIcon = disclosureClosedIcon;
		}
	}
}