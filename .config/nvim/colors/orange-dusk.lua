-- This file should be edited by the user. Read the instructions of each section and then edit them as desired.

--[[ Highlite, a Neovim colorscheme template.
	* Author:     Iron-E (https://github.com/Iron-E)
	* Repository: https://github.com/nvim-orange-dark

	Initially forked from vim-rnb, a Vim colorsheme template:
	* Author:        Romain Lafourcade (https://github.com/romainl)
	* Canonical URL: https://github.com/romainl/vim-rnb
]]

--[[ Introduction
	This template is designed to help Neovim users create their own colorschemes without much effort.

	You will not need any additional tooling to run this file. Just open it in Neovim and follow the instructions.

	The process is divided in five steps:
	1. Rename the template,
	2. Edit your colorscheme's information,
	3. Define your colors,
	4. Define your highlight groups and links, and
	5. Sourcing your colorscheme.
]]

--[[ Step 1: Renaming
	* If this file is distributed with a colorscheme it's probably already named correctly
	  and you can skip this step.
	* If you forked/cloned/copied this repository to create your own colorscheme, you will have to
	  rename this template to match the name of your colorscheme.

	NOTE: Neovim doesn't really care about whitespace in the name of the colorscheme but it does for
	filenames so make sure your filename doesn't have any whitespace character.

	| colorscheme name  | module name | template filename |
	|:-----------------:|:-----------:|:-----------------:|
	| foobar            | foobar      | foobar.lua        |
	| foo-bar           | foo_bar     | foo_bar.lua       |
	| foo bar           | foo_bar     | foo_bar.lua       |
	| foo_bar           | foo_bar     | foo_bar.lua       |

	Rename the following files:
	* `colors/orange-dark.vim`
	* `lua/orange-dark.lua`

	Where 'orange-dark' is the name of your colorscheme.

	TIP: If you are on a Unix-based system (or have WSL on Windows) you can use the setup script at the root of this repo.
	     See the README for more details.
]]


--[[ Step 2: Information
	In this step you will define information that helps Neovim process:

	1. How users access your colorscheme;
	2. How your colorscheme should be rendered.
]]

-- This is the name of your colorscheme which will be used as per |g:colors_name|.
vim.g.colors_name = 'orange-dusk'

--[[ Step 3: Colors
	Next you will define all of the colors that you will use for the color scheme.

	Each one should be made up of three parts:

```lua
	<color name> = { -- Give each color a distinctive name.
		'#<hex color code>', -- Hexadecimal color used in GVim/MacVim or 'NONE'.
		<16-bit color code>, -- Integer 0–255 used by terminals supporting 256 colors or 'NONE'.
		'<ANSI color name>'  -- color name used by less capable color terminals, can be 'darkred',
		                       'red', 'darkgreen', 'green', 'darkyellow', 'yellow', 'darkblue',
		                       'blue', 'darkmagenta', 'magenta', 'black', 'darkgrey', 'grey',
		                       'white', or 'NONE'
	}
```

	NOTE: See https://gist.github.com/gagbo/7943c9a71cab22b641d2904a6d59ec3a
	      for a program that can generate 16-bit colors from a Hex code.

	If your colors are defined correctly, the resulting colorscheme is guaranteed
	to work in GVim (Windows/Linux), MacVim (MacOS), and any properly set up terminal
	emulator.

	NOTE: |Replace-mode| will probably be useful here.
]]

local black       = {'#192e40', 0, 'black'}
local gray        = {'#c3c0b8', 8, 'darkgray'}
local gray_dark   = {'#284259', 8, 'darkgray'}
local gray_darker = {'#152636', 0, 'black'}
-- local gray_light  = {'#fff6e6', 7, 'gray'}
local white       = {'#fff6e6', 7, 'gray'}
local white_light       = {'#fffef8', 15, 'white'}

local tan = {'#dc9c88', 11, 'yellow'}

local red       = {'#c20f47', 1, 'darkred'}
-- local red_dark  = {'#a80000', 124, 'darkred'}
local red_light = {'#ec1b5d', 9, 'red'}

local orange       = {'#e9986d', 3, 'darkyellow'}
local orange_light = {'#eeae8c', 11, 'yellow'}

-- local yellow = {'#f0df33', 227, 'yellow'}

-- local green_dark  = {'#70d533', 113, 'darkgreen'}
local green       = {'#25a37e', 2,  'darkgreen'}
local green_light = {'#33cc9e', 10, 'green'}
local turqoise    = {'#2ef2df', 50, 'green'}

local blue = {'#5d92bf', 4,  'darkblue'}
local blue_light = {'#7da7cd', 12,  'blue'}
local cyan = {'#54bfb8', 6,  'darkcyan'}
local cyan_light = {'#72ccc6', 14,  'cyan'}
-- local ice  = {'#95c5ff', 111, 'cyan'}
-- local teal = {'#60afff', 75,  'blue'}

-- local magenta      = {'#d5508f', 168, 'magenta'}
-- local magenta_dark = {'#bb0099', 126, 'darkmagenta'}
local pink         = {'#b099a3', 139, 'magenta'}
local pink_light   = {'#ceb6bb', 181, 'white'}
local purple       = {'#6768bf', 5, 'darkmagenta'}
local purple_light = {'#8787cc', 13, 'magenta'}

--[[ Step 4: highlights
	You can define highlight groups like this:

```lua
	<highlight group name> = {
		-- The color for the background, `NONE`, `FG` or `BG`
		bg = <color>,

		-- The color for the foreground, `NONE`, `FG` or `BG`
		fg = <color>

		-- The |highlight-blend| value, if one is desired.
		[, blend = <integer>]

		-- Style can be 'bold', 'italic', and more. See |attr-list| for more information.
		-- It can also have a color, and/or multiple <cterm>s.
		[, style = <cterm>|{<cterm> (, <cterm>) [color=<color>]} ]
	}
```

	You can also link one highlight group to another:

```lua
	<highlight group name> = '<highlight group name>'
```
	____________________________________________________________________________

	Here is an example to define `SpellBad` and then link some new group
	`SpellWorse` to it:

```lua
	SpellBad = { -- ← name of the highlight group
		bg=NONE, -- background color
		fg=red, -- foureground color
		style={ -- the style
			'undercurl', -- undercurl (squiggly line)
			color=red -- the color of the undercurl
		}
	},
	SpellWorse = 'SpellBad'
```

	If you weren't satisfied with undercurl, and also wanted another effect, you can
	add another one below 'undercurl' and it will be applied as well:

```lua
	SpellBad = { -- ← name of the highlight group
		bg=NONE, -- background color
		fg=red, -- foureground color
		style={ -- the style
			'undercurl', -- undercurl (squiggly line)
			'standout'
			color=red -- the color of the undercurl
		}
	}
```
	____________________________________________________________________________

	If you want to create a colorscheme that is responsive to the user's
	'background' setting, you can specify special `light` and `dark` keys to
	define how each group should be highlighted in each case.

```lua
	SpellBad = {
		bg=NONE,
		dark={fg=white},
		light={fg=black},
		style={'undercurl', color=red}
	}
```

	Whenever the user changes their 'background' setting, the settings inside of
	whichever key is relevant will be loaded.
	____________________________________________________________________________

	You can add any custom highlight group to the standard list below but you
	shouldn't remove any if you want a working colorscheme. Most of them are
	described under |highlight-default|, some from |group-name|, and others from
	common syntax groups.  Both help sections are good reads.
	____________________________________________________________________________

	If you want to inherit a specific attribute of another highlight group, you
	can do the following:

```lua
	SpellBad = function(self)
		local inherited_style = self.SpellRare.style
		inherited_style.color = red

		return {
			bg=NONE,
			fg=NONE,
			style=inherited_style
		}
	end
```

	The function will be executed by |orange-dark| and transformed into the
	expected result.
	____________________________________________________________________________

	NOTE: |Replace-mode| will probably be useful here.

	NOTE: /As long as you do not remove any highlight groups or colors/, you can
	      safely ignore any highlight groups that are `link`ed to others.

	      For example, programming languages almost exclusively link to the 1st
	      and 2nd sections, so as long as you define everything there you will
	      automatically be defining the rest of the highlights, which is one of
	      the benefits of using this template.
]]

--[[ DO NOT EDIT `BG` NOR `FG`. ]]
local BG = 'bg'
local FG = 'fg'
local NONE = {}

--[[ These are the ones you should edit. ]]
-- This is the only highlight that must be defined separately.
local highlight_group_normal = {fg=white, bg=NONE}
-- This is where the rest of your highlights should go.
local highlight_groups = {
	--[[ 4.1. Text Analysis ]]
	Comment = {fg=gray, style='italic'},
	NonText = {fg=gray_darker},
	EndOfBuffer = 'NonText',
	Whitespace  = 'NonText',

	--[[ 4.1.1. Literals]]
	Constant = {fg=orange},
	String = {fg=blue},
	Character = {fg=cyan},
	Number  = 'Constant',
	Boolean = {fg=purple},
	Float   = 'Number',

	--[[ 4.1.2. Identifiers]]
	Identifier = {fg=FG},
	Function = {fg=orange},

	--[[ 4.1.3. Syntax]]
	Statement   = {fg=blue_light},
	Conditional = {fg=blue_light, style='italic'},
	Repeat   = {fg=cyan_light, style='italic'},
	Label    = {fg=pink, style='bold'},
	Operator = {fg=green_light, style='bold'},
	Keyword  = {fg=blue_light},
	Exception = {fg=red_light, style='bold'},
	Noise = 'Delimiter',

	--[[ 4.1.4. Metatextual Information]]
	PreProc = {fg=cyan_light},
	Include = {fg=green_light, style='nocombine'},
	Define = {fg=blue, style='nocombine'},
	Macro  = {fg=blue, style='italic'},
	PreCondit = {fg=orange, style='italic'},

	--[[ 4.1.5. Semantics]]
	Type         = {fg=blue, style='bold'},
	StorageClass = {fg=orange, style='bold'},
	Structure = {fg=green, style='bold'},
	Typedef = {fg=magenta, style='italic'},

	--[[ 4.1.6. Edge Cases]]
	Special = {fg=purple, style='bold'},
	SpecialChar = {fg=red_light, style='italic'},
	SpecialKey = 'Character',
	Tag = 'Underlined',
	Delimiter = {fg=white},
	SpecialComment = {fg=gray, style={'bold', 'nocombine'}},
	Debug = 'WarningMsg',

	--[[ 4.1.7. Help Syntax]]
	Underlined = {fg=turqoise, style='underline'},
	Ignore = {fg=gray},
	Error = {fg=FG, bg=red, style='bold'},
	Todo = {fg=black, bg=orange, style='bold'},
	Hint = {fg=black, bg=blue, style='bold'},
	Info = {fg=black, bg=pink_light, style='bold'},
	Warning = {fg=black, bg=orange, style='bold'},

	--[[ 4.2... Editor UI  ]]
	--[[ 4.2.1. Status Line]]
	StatusLine = {fg=black, bg=orange, style='bold'},
	StatusLineNC = function(self) return {fg=gray, bg=gray_darker} end,
	StatusLineTerm = 'StatusLine',
	StatusLineTermNC = 'StatusLineNC',

	--[[ 4.2.2. Separators]]
	FloatBorder = {fg=gray},
	TabLine = function(self) return {fg=FG, bg=black} end,
	TabLineFill = function(self) return {fg=self.TabLine.bg, bg=NONE} end,
	TabLineSel = function(self) return {fg=orange, bg=highlight_group_normal.bg} end,
	Title = {style='bold'},
	VertSplit = {fg=white},

	--[[ 4.2.3. Conditional Line Highlighting]]
	Conceal = 'NonText',
	CursorLine   = {bg=gray_darker},
	CursorLineNr = {fg=orange, bg=gray_darker},
	debugBreakpoint = 'ErrorMsg',
	debugPC = 'ColorColumn',
	LineNr  = {fg=gray_dark},
	QuickFixLine = function(self) return {bg=self.StatusLine.bg} end,
	Visual    = {style='inverse'},
	VisualNOS = {bg=gray_darker},

	--[[ 4.2.4. Popup Menu]]
	Pmenu = {fg=FG, bg=black},
	PmenuSbar = {bg=gray_darker},
	PmenuSel  = {fg=black, bg=orange},
	PmenuThumb = {bg=white},
	WildMenu = 'PmenuSel',

	--[[ 4.2.5. Folds]]
	FoldColumn = {bg=gray_darker, style='bold'},
	Folded = {fg=black,  bg=orange, style='italic'},

	--[[ 4.2.6. Diffs]]
	DiffAdd    = {fg=black, bg=green},
	DiffChange = NONE,
	DiffDelete = function(self) return {fg=self.DiffAdd.fg, bg=red} end,
	DiffText   = function(self) return {fg=self.DiffAdd.fg, bg=orange} end,

	--[[ 4.2.7. Searching]]
	IncSearch  = {style='inverse'},
	MatchParen = {fg=white, style={'bold', 'underline'}},
	Search = {fg=black, bg=orange, style={'underline', color=black}},

	--[[ 4.2.8. Spelling]]
	SpellBad   = {style={'undercurl', color=red_light}},
	SpellCap   = {style={'undercurl', color=blue_light}},
	SpellLocal = {style={'undercurl', color=green_light}},
	SpellRare  = {style={'undercurl', color=orange_light}},

	--[[ 4.2.9. Conditional Column Highlighting]]
	ColorColumn = {style='inverse'},
	SignColumn  = NONE,

	--[[ 4.2.10. Messages]]
	ErrorMsg = {fg=red, style='bold'},
	HintMsg  = {fg=purple, style='italic'},
	InfoMsg  = {fg=pink_light, style='italic'},
	ModeMsg  = {fg=FG, style='bold'},
	WarningMsg = {fg=orange, style='bold'},
	Question   = {fg=orange_light, style='underline'},

	--[[ 4.2.11. LSP / Diagnostics ]]
	DiagnosticError = 'Error',
	DiagnosticFloatingError = 'ErrorMsg',
	DiagnosticSignError = 'DiagnosticFloatingError',

	DiagnosticWarn = 'Warning',
	DiagnosticFloatingWarn = 'WarningMsg',
	DiagnosticSignWarn = 'DiagnosticFloatingWarn',

	DiagnosticHint = 'Hint',
	DiagnosticFloatingHint = 'HintMsg',
	DiagnosticSignHint = 'DiagnosticFloatingHint',

	DiagnosticInfo = 'Info',
	DiagnosticFloatingInfo = 'InfoMsg',
	DiagnosticSignInfo = 'DiagnosticFloatingInfo',

	DiagnosticUnderlineError = {style={'undercurl', color=red_light}},
	DiagnosticUnderlineHint  = {style={'undercurl', color=green_light}},
	DiagnosticUnderlineInfo  = {style={'undercurl', color=pink_light}},
	DiagnosticUnderlineWarn = {style={'undercurl', color=orange_light}},

	LspDiagnosticsDefaultError = 'DiagnosticError',
	LspDiagnosticsFloatingError = 'DiagnosticFloatingError',
	LspDiagnosticsSignError = 'DiagnosticSignError',

	LspDiagnosticsDefaultWarning = 'DiagnosticWarn',
	LspDiagnosticsFloatingWarning = 'DiagnosticFloatingWarn',
	LspDiagnosticsSignWarning = 'DiagnosticSignWarn',

	LspDiagnosticsDefaultHint = 'DiagnosticHint',
	LspDiagnosticsFloatingHint = 'DiagnosticFloatingHint',
	LspDiagnosticsSignHint = 'DiagnosticSignHint',

	LspDiagnosticsDefaultInformation = 'DiagnosticInfo',
	LspDiagnosticsFloatingInformation = 'DiagnosticFloatingInfo',
	LspDiagnosticsSignInformation = 'DiagnosticSignInfo',

	LspDiagnosticsUnderlineError = 'DiagnosticUnderlineError',
	LspDiagnosticsUnderlineHint  = 'DiagnosticUnderlineHint',
	LspDiagnosticsUnderlineInfo  = 'DiagnosticUnderlineInfo',
	LspDiagnosticsUnderlineWarning = 'DiagnosticUnderlineWarn',

	--[[ 4.2.12. Cursor ]]
	Cursor   = {style='inverse'},
	CursorIM = 'Cursor',
	CursorColumn = {bg=gray_dark},

	--[[ 4.2.13. Misc ]]
	Directory = {fg=orange, style='bold'},

	--[[ 4.3. Programming Languages
		Everything in this section is OPTIONAL. Feel free to remove everything
		here if you don't want to define it, or add more if there's something
		missing.
	]]
	--[[ 4.3.1. C ]]
	cConstant    = 'Constant',
	cCustomClass = 'Type',

	--[[ 4.3.2. C++ ]]
	cppSTLexception = 'Exception',
	cppSTLnamespace = 'String',

	--[[ 4.3.3 C# ]]
	csBraces = 'Delimiter',
	csClass  = 'Structure',
	csClassType = 'Type',
	csContextualStatement = 'Conditional',
	csEndColon = 'Delimiter',
	csGeneric  = 'Typedef',
	csInterpolation = 'Include',
	csInterpolationDelimiter = 'SpecialChar',
	csLogicSymbols  = 'Operator',
	csModifier = 'Keyword',
	csNew = 'Operator',
	csNewType = 'Type',
	csParens  = 'Delimiter',
	csPreCondit  = 'PreProc',
	csQuote = 'Delimiter',
	csRepeat  = 'Repeat',
	csStorage = 'StorageClass',
	csUnspecifiedStatement = 'Statement',
	csXmlTag = 'Define',
	csXmlTagName = 'Define',
	razorCode = 'PreProc',
	razorcsLHSMemberAccessOperator = 'Noise',
	razorcsRHSMemberAccessOperator = 'razorcsLHSMemberAccessOperator',
	razorcsStringDelimiter = 'razorhtmlValueDelimiter',
	razorcsTypeNullable = 'Special',
	razorcsUnaryOperatorKeyword = 'Operator',
	razorDelimiter = 'Delimiter',
	razorEventAttribute = 'PreCondit',
	razorFor  = 'razorIf',
	razorhtmlAttribute = 'htmlArg',
	razorhtmlAttributeOperator = 'Operator',
	razorhtmlTag = 'htmlTag',
	razorhtmlValueDelimiter = 'Delimiter',
	razorIf  = 'PreCondit',
	razorImplicitExpression = 'PreProc',
	razorLine = 'Constant',
	razorUsing = 'Include',

	--[[ 4.3.4. CSS ]]
	cssAtRule          = 'PreCondit',
	cssAttr            = 'Keyword',
	cssAttrComma       = 'Noise',
	cssAttrRegion      = 'Keyword',
	cssBraces          = 'Delimiter',
	cssClassName       = 'Identifier',
	cssClassNameDot    = 'Noise',
	cssFlexibleBoxAttr = 'cssAttr',
	cssFunctionComma   = 'Noise',
	cssImportant       = 'Exception',
	cssNoise           = 'Noise',
	cssProp            = 'Label',
	cssPseudoClass     = 'Special',
	cssPseudoClassId   = 'cssSelectorOp',
	cssSelectorOp      = 'Operator',
	cssTagName         = 'Structure',
	cssUnitDecorators  = 'Type',
	scssAmpersand      = 'Special',
	scssAttribute      = 'Noise',
	scssBoolean        = 'Boolean',
	scssDefault        = 'Keyword',
	scssElse           = 'scssIf',
	scssMixinName      = function(self)
		local super = self.cssClassName
		return {bg=super.bg, fg=super.fg, style='italic'}
	end,
	scssIf             = 'PreCondit',
	scssInclude        = 'Include',
	scssSelectorChar   = 'Delimiter',
	scssDefinition     = 'PreProc',
	scssSelectorName   = 'Identifier',
	scssVariable       = 'Define',
	scssVariableAssignment = 'Operator',

	--[[ 4.3.5. Dart ]]
	dartLibrary = 'Statement',

	--[[ 4.3.6. dot ]]
	dotKeyChar = 'Character',
	dotType    = 'Type',

	--[[ 4.3.7. Go ]]
	goBlock    = 'Delimiter',
	goBoolean  = 'Boolean',
	goBuiltins = 'Operator',
	goField    = 'Identifier',
	goFloat    = 'Float',
	goFormatSpecifier = 'Character',
	goFunction = 'Function',
	goFunctionCall   = 'goFunction',
	goFunctionReturn = NONE,
	goMethodCall = 'goFunctionCall',
	goParamType  = 'goReceiverType',
	goPointerOperator = 'SpecialChar',
	goPredefinedIdentifiers = 'Constant',
	goReceiver     = 'goBlock',
	goReceiverType = 'goTypeName',
	goSimpleParams = 'goBlock',
	goType = 'Type',
	goTypeConstructor = 'goFunction',
	goTypeName  = 'Type',
	goVarAssign = 'Identifier',
	goVarDefs   = 'goVarAssign',

	--[[ 4.3.8. HTML ]]
	htmlArg    = 'Label',
	htmlBold   = {fg=highlight_group_normal.fg, style='bold'},
	htmlTitle  = 'htmlBold',
	htmlEndTag = 'htmlTag',
	htmlH1 = 'markdownH1',
	htmlH2 = 'markdownH2',
	htmlH3 = 'markdownH3',
	htmlH4 = 'markdownH4',
	htmlH5 = 'markdownH5',
	htmlH6 = 'markdownH6',
	htmlItalic  = {style='italic'},
	htmlSpecialTagName = 'Keyword',
	htmlTag  = 'Special',
	htmlTagN = 'Typedef',
	htmlTagName = 'Type',

	--[[ 4.3.9. Java ]]
	javaClassDecl = 'Structure',

	--[[ 4.3.10. JavaScript ]]
	jsFuncBlock   = 'Function',
	jsObjectKey   = 'Type',
	jsReturn      = 'Keyword',
	jsVariableDef = 'Identifier',

	--[[ 4.3.11. JSON ]]
	jsonBraces = 'luaBraces',
	jsonEscape = 'SpecialChar',
	jsonKeywordMatch = 'Operator',
	jsonNull   = 'Constant',
	jsonQuote  = 'Delimiter',
	jsonString = 'String',
	jsonStringSQError = 'Exception',

	--[[ 4.3.12. Lua ]]
	luaBraces   = 'Structure',
	luaBrackets = 'Delimiter',
	luaBuiltin  = 'Keyword',
	luaComma    = 'Delimiter',
	luaFuncArgName = 'Identifier',
	luaFuncCall = 'Function',
	luaFuncId   = 'luaNoise',
	luaFuncKeyword = 'Type',
	luaFuncName   = 'Function',
	luaFuncParens = 'Delimiter',
	luaFuncTable  = 'Structure',
	luaIn     = 'luaRepeat',
	luaLocal  = 'Type',
	luaNoise  = 'Delimiter',
	luaParens = 'Delimiter',
	luaSpecialTable = 'Structure',
	luaSpecialValue = 'Function',
	luaStringLongTag = function(self)
		local delimiter = self.Delimiter
		return {bg=delimiter.bg, fg=delimiter.fg, style='italic'}
	end,

	--[[ 4.3.12. Make ]]
	makeCommands   = 'Statment',
	makeSpecTarget = 'Type',

	--[[ 4.3.13. Markdown ]]
	markdownCode = 'mkdCode',
	markdownCodeDelimiter = 'mkdCodeDelimiter',
	markdownH1 = {fg=red_light, style='bold'},
	markdownH2 = {fg=orange_light, style='bold'},
	markdownH3 = {fg=green_light, style='bold'},
	markdownH4 = {fg=cyan_light, style='bold'},
	markdownH5 = {fg=blue_light, style='bold'},
	markdownH6 = {fg=purple_light, style='bold'},
	markdownLinkDelimiter = 'Delimiter',
	markdownLinkTextDelimiter = 'markdownLinkDelimiter',
	markdownUrl = 'Underlined',
	mkdBold = 'Ignore',
	mkdBoldItalic = 'mkdBold',
	mkdCode = 'Keyword',
	mkdCodeDelimiter = 'mkdBold',
	mkdCodeEnd = 'mkdCodeStart',
	mkdCodeStart = 'mkdCodeDelimiter',
	mkdHeading = 'Delimiter',
	mkdItalic  = 'mkdBold',
	mkdLineBreak = 'NonText',
	mkdListItem  = 'Special',
	mkdRule = function(self) return {fg=self.Ignore.fg, style={'underline', color=self.Delimiter.fg}} end,

	--[[ 4.3.20. Python ]]
	pythonBrackets    = 'Delimiter',
	pythonBuiltinFunc = 'Operator',
	pythonBuiltinObj  = 'Type',
	pythonBuiltinType = 'Type',
	pythonClass       = 'Structure',
	pythonClassParameters = 'pythonParameters',
	pythonDecorator  = 'PreProc',
	pythonDottedName = 'Identifier',
	pythonError     = 'Error',
	pythonException = 'Exception',
	pythonInclude   = 'Include',
	pythonIndentError = 'pythonError',
	pythonLambdaExpr  = 'pythonOperator',
	pythonOperator = 'Operator',
	pythonParam    = 'Identifier',
	pythonParameters = 'Delimiter',
	pythonSelf = 'Statement',
	pythonSpaceError = 'pythonError',
	pythonStatement  = 'Statement',

	--[[ 4.3.21. Ruby ]]
	rubyClass  = 'Structure',
	rubyDefine = 'Define',
	rubyInterpolationDelimiter = 'Delimiter',

	--[[ 4.3.23. Scala ]]
	scalaKeyword = 'Keyword',
	scalaNameDefinition = 'Identifier',

	--[[ 4.3.24. shell ]]
	shDerefSimple = 'SpecialChar',
	shFunctionKey = 'Function',
	shLoop  = 'Repeat',
	shParen = 'Delimiter',
	shQuote = 'Delimiter',
	shSet   = 'Statement',
	shTestOpr = 'Debug',

	--[[ 4.3.25. Solidity ]]
	solBuiltinType  = 'Type',
	solContract     = 'Typedef',
	solContractName = 'Function',

	--[[ 4.3.26. TOML ]]
	tomlComment = 'Comment',
	tomlDate  = 'Special',
	tomlFloat = 'Float',
	tomlKey   = 'Label',
	tomlTable = 'Structure',

	--[[ 4.3.27. VimScript ]]
	vimCmdSep   = 'Delimiter',
	vimFunction = 'Function',
	vimFgBgAttrib = 'Constant',
	vimHiCterm = 'Label',
	vimHiCtermFgBg = 'vimHiCterm',
	vimHiGroup = 'Typedef',
	vimHiGui   = 'vimHiCterm',
	vimHiGuiFgBg = 'vimHiGui',
	vimHiKeyList = 'Operator',
	vimIsCommand = 'Identifier',
	vimOption = 'Keyword',
	vimScriptDelim = 'Ignore',
	vimSet = 'String',
	vimSetEqual = 'Operator',
	vimSetSep   = 'Delimiter',
	vimUserFunc = 'vimFunction',

	--[[ 4.3.28. XML ]]
	xmlAttrib = 'htmlArg',
	xmlEndTag = 'xmlTag',
	xmlEqual  = 'Operator',
	xmlTag    = 'htmlTag',
	xmlTagName = 'htmlTagName',

	--[[ 4.3.29. SQL ]]
	sqlKeyword = 'Keyword',
	sqlParen   = 'Delimiter',
	sqlSpecial = 'Constant',
	sqlStatement = 'Statement',
	sqlParenFunc = 'Function',

	--[[ 4.3.30. dos INI ]]
	dosiniHeader = 'Title',
	dosiniLabel  = 'Label',

	--[[ 4.3.31. Crontab ]]
	crontabDay  = 'StorageClass',
	crontabDow  = 'String',
	crontabHr   = 'Number',
	crontabMin  = 'Float',
	crontabMnth = 'Structure',

	--[[ 4.3.32. PlantUML ]]
	plantumlArrowLR   = 'Statement',
	plantumlColonLine = NONE,
	plantumlMindmap   = 'Label',
	plantumlMindmap2  = 'Label',

	--[[ 4.3.33. YAML ]]
	yamlKey = 'Label',

	--[[ 4.3.34. Git ]]
	diffAdded = 'DiffAdd',
	diffRemoved = 'DiffDelete',
	gitcommitHeader = 'SpecialComment',
	gitcommitDiscardedFile = 'gitcommitSelectedFile',
	gitcommitOverFlow = 'Error',
	gitcommitSelectedFile = 'Directory',
	gitcommitSummary  = 'Title',
	gitcommitUntrackedFile = 'gitcommitSelectedFile',
	gitconfigAssignment = 'String',
	gitconfigEscape = 'SpecialChar',
	gitconfigNone  = 'Operator',
	gitconfigSection = 'Structure',
	gitconfigVariable = 'Label',
	gitrebaseBreak = 'Keyword',
	gitrebaseCommit = 'Tag',
	gitrebaseDrop = 'Exception',
	gitrebaseEdit = 'Define',
	gitrebaseExec = 'PreProc',
	gitrebaseFixup = 'gitrebaseSquash',
	gitrebaseMerge = 'PreProc',
	gitrebasePick  = 'Include',
	gitrebaseReset = 'gitrebaseLabel',
	gitrebaseReword  = 'gitrebasePick',
	gitrebaseSquash  = 'Macro',
	gitrebaseSummary = 'Title',

	--[[ 4.3.35. Vimtex ]]
	texMathRegion = 'Number',
	texMathSub   = 'Number',
	texMathSuper = 'Number',
	texMathRegionX  = 'Number',
	texMathRegionXX = 'Number',

	--[[ 4.3.36. Coq ]]
	coqConstructor   = 'Constant',
	coqDefBinderType = 'coqDefType',
	coqDefContents1  = 'coqConstructor',
	coqDefType  = 'Typedef',
	coqIndBinderTerm  = 'coqDefBinderType',
	coqIndConstructor = 'Delimiter',
	coqIndTerm = 'Type',
	coqKwd = 'Keyword',
	coqKwdParen   = 'Function',
	coqProofDelim = 'coqVernacCmd',
	coqProofDot   = 'coqTermPunctuation',
	coqProofPunctuation = 'coqTermPunctuation',
	coqRequire = 'Include',
	coqTactic  = 'Operator',
	coqTermPunctuation = 'Delimiter',
	coqVernacCmd = 'Statement',
	coqVernacPunctuation = 'coqTermPunctuation',

	--[[ 4.3.37 Help ]]
	helpHeader = 'Label',
	helpOption = 'Keyword',
	helpHeadline = 'Title',
	helpSectionDelim = 'Delimiter',
	helpHyperTextJump = 'Underlined',

	--[[ 4.3.38 Man ]]
	-- manBold = function(self) return vim.tbl_extend('force', self.mkdCode, {style='nocombine'}) end,
	manOptionDesc = 'Special',
	manReference = 'Tag',
	manUnderline = 'Label',

	--[[ 4.3.39 Rust ]]
	rustIdentifier = 'Identifier',

	--[[ 4.3.40 XXD ]]
	xxdAddress = 'Label',
	xxdAscii = 'Character',
	xxdDot = 'Ignore',
	xxdSep = 'Delimiter',

	--[[ 4.4. Plugins
		Everything in this section is OPTIONAL. Feel free to remove everything
		here if you don't want to define it, or add more if there's something
		missing.
	]]
	--[[ 4.4.1. ALE ]]
	ALEErrorSign   = 'DiagnosticSignError',
	ALEWarningSign = 'DiagnosticSignWarn',

	--[[ 4.4.2. coc.nvim ]]
	CocErrorHighlight = 'DiagnosticUnderlineError',
	CocErrorSign = 'DiagnosticSignError',
	CocHintHighlight  = 'DiagnosticUnderlineHint',
	CocHintSign  = 'DiagnosticSignHint',
	CocInfoHighlight  = 'DiagnosticUnderlineInfo',
	CocInfoSign  = 'DiagnosticSignInfo',
	CocWarningHighlight = 'DiagnosticUnderlineWarn',
	CocWarningSign = 'DiagnosticSignWarn',

	--[[ 4.4.2. vim-jumpmotion / vim-easymotion ]]
	EasyMotion = 'IncSearch',
	JumpMotion = 'EasyMotion',

	--[[ 4.4.4. vim-gitgutter / vim-signify / gitsigns.nvim ]]
	GitGutterAdd    = {fg = green},
	GitGutterChange = {fg = orange},
	GitGutterDelete = {fg = red},
	GitGutterChangeDelete = 'GitGutterChange',

	SignifySignAdd    = 'GitGutterAdd',
	SignifySignChange = 'GitGutterChange',
	SignifySignDelete = 'GitGutterDelete',
	SignifySignChangeDelete = 'GitGutterChangeDelete',

	GitSignsAdd = 'GitGutterAdd',
	GitSignsChange = 'GitGutterChange',
	GitSignsDelete = 'GitGutterDelete',

	--[[ 4.4.5. vim-indent-guides ]]
	IndentGuidesOdd  = {bg=gray_darker},
	IndentGuidesEven = {bg=gray},

	--[[ 4.4.7. NERDTree ]]
	NERDTreeCWD = 'Label',
	NERDTreeUp  = 'Operator',
	NERDTreeDir = 'Directory',
	NERDTreeDirSlash = 'Delimiter',
	NERDTreeOpenable = 'NERDTreeDir',
	NERDTreeClosable = 'NERDTreeOpenable',
	NERDTreeExecFile = 'Function',
	NERDTreeLinkTarget = 'Tag',

	--[[ 4.4.8. nvim-treesitter ]]
	TSConstBuiltin = 'Constant',
	TSConstructor  = 'Typedef',
	TSFuncBuiltin  = 'Function',
	TSStringEscape = 'Character',
	TSStringRegex  = 'SpecialChar',
	TSURI = 'Tag',
	TSVariableBuiltin = 'Identifier',

	--[[ 4.4.9. barbar.nvim ]]
	BufferCurrent       = 'TabLineSel',
	BufferCurrentIndex  = function(self) return {fg=self.InfoMsg.fg, bg=self.BufferCurrent.bg} end,
	BufferCurrentMod    = {fg=tan, bg=black, style='bold'},
	BufferCurrentSign   = 'HintMsg',
	BufferCurrentTarget = 'BufferCurrentSign',

	BufferInactive       = 'BufferVisible',
	BufferInactiveIndex  = function(self) return {fg=self.InfoMsg.fg, bg=self.BufferInactive.bg} end,
	BufferInactiveMod    = 'BufferVisibleMod',
	BufferInactiveSign   = 'BufferVisibleSign',
	BufferInactiveTarget = 'BufferVisibleTarget',

	BufferTabpages    = {fg=highlight_group_normal.bg, style={'bold', 'reverse'}},
	BufferTabpageFill = 'TabLineFill',

	BufferVisible       = 'TabLine',
	BufferVisibleIndex  = function(self) return {fg=self.InfoMsg.fg, bg=self.BufferVisible.bg} end,
	BufferVisibleMod    = function(self) return {fg=white, bg=self.BufferVisible.bg, style='italic'} end,
	BufferVisibleSign   = 'BufferVisible',
	BufferVisibleTarget = function(self)
		local super = self.BufferVisibleMod
		return {fg=super.fg, bg=super.bg, style='bold'}
	end,

	--[[ 4.4.10. vim-sandwhich ]]
	OperatorSandwichChange = 'DiffText',

	--[[ 4.4.11. Fern ]]
	FernBranchText = 'Directory',

	--[[ 4.4.12. LSPSaga ]]
	DefinitionCount = 'Number',
	DefinitionIcon  = 'Special',
	ReferencesCount = 'Number',
	ReferencesIcon  = 'DefinitionIcon',
	TargetFileName  = 'Directory',
	TargetWord = 'Title',

	--[[ 4.4.13. indent-blankline.nvim ]]
	IndentBlanklineChar = function(self) return vim.tbl_extend('force', self.Whitespace, {style='nocombine'}) end,
	IndentBlanklineSpaceChar = 'IndentBlanklineChar',

	--[[ 4.4.14. trouble.nvim ]]
	TroubleCount = function(self) return vim.tbl_extend('force', self.Number, {style='underline'}) end,

	--[[ 4.4.15. todo-comments.nvim ]]
	TodoFgFIX = function(self) return {fg=self.ErrorMsg.fg} end,
	TodoFgHACK = function(self) return {fg=self.Todo.bg} end,
	TodoFgNOTE = 'HintMsg',
	TodoFgPERF = 'InfoMsg',
	TodoFgTODO = {fg=cyan, style='italic'},
	TodoFgWARN = function(self) return {fg=self.WarningMsg.fg} end,

	TodoBgFIX = function(self) return {fg=black, bg=self.ErrorMsg.fg, style={'bold', 'italic', 'nocombine'}} end,
	TodoBgHACK = function(self) return {fg=black, bg=self.Todo.bg, style={'bold', 'italic', 'nocombine'}} end,
	TodoBgNOTE = function(self) return {fg=black, bg=self.Hint.bg, style={'bold', 'italic', 'nocombine'}} end,
	TodoBgPERF = function(self) return {fg=black, bg=self.Info.bg, style={'bold', 'italic', 'nocombine'}} end,
	TodoBgTODO = {fg=black, bg=cyan, style={'bold', 'italic', 'nocombine'}},
	TodoBgWARN = function(self) return {fg=black, bg=self.Warning.bg, style={'bold', 'italic', 'nocombine'}} end,

	TodoSignFIX  = 'TodoFgFIX',
	TodoSignHACK = 'TodoFgHACK',
	TodoSignNOTE = 'TodoFgNOTE',
	TodoSignPERF = 'TodoFgPERF',
	TodoSignTODO = 'TodoFgTODO',
	TodoSignWARN = 'TodoFgWARN',

	--[[ 4.4.16. nvim-cmp ]]
	CmpDocumentationBorder = 'FloatBorder',
	CmpItemAbbrDefault = 'Ignore',
	CmpItemAbbrMatchDefault = 'Underlined',
	CmpItemAbbrMatchFuzzyDefault = {fg=highlight_group_normal.fg, style={'nocombine', 'underline'}},
	CmpItemKindDefault = 'Type',
	CmpItemKindClassDefault = 'CmpItemKindStructDefault',
	CmpItemKindColorDefault = 'Label',
	CmpItemKindConstantDefault = 'Constant',
	CmpItemKindConstructorDefault = 'CmpItemKindMethodDefault',
	CmpItemKindEnumDefault = 'CmpItemKindStructDefault',
	CmpItemKindEnumMemberDefault = 'CmpItemKindConstantDefault',
	CmpItemKindEventDefault = 'Repeat',
	CmpItemKindFieldDefault = 'Identifier',
	CmpItemKindFileDefault = 'Directory',
	CmpItemKindFolderDefault = 'CmpItemKindFileDefault',
	CmpItemKindFunctionDefault = 'Function',
	CmpItemKindInterfaceDefault = 'Type',
	CmpItemKindKeywordDefault = 'Keyword',
	CmpItemKindMethodDefault = 'CmpItemKindFunctionDefault',
	CmpItemKindModuleDefault = 'Include',
	CmpItemKindOperatorDefault = 'Operator',
	CmpItemKindPropertyDefault = 'CmpItemKindFieldDefault',
	CmpItemKindReferenceDefault = 'StorageClass',
	CmpItemKindSnippetDefault = 'Special',
	CmpItemKindStructDefault = 'Structure',
	CmpItemKindTextDefault = 'String',
	CmpItemKindTypeParameterDefault = 'Typedef',
	CmpItemKindUnitDefault = 'CmpItemKindStructDefault',
	CmpItemKindValueDefault = 'CmpItemKindConstantDefault',
	CmpItemKindVariableDefault = 'Identifier',
	CmpScrollThumb = function(self) return {fg=self.Pmenu.bg, style='bold'} end,

	--[[ 4.4.17. packer.nvim ]]
	packerFail = 'ErrorMsg',
	packerHash = 'Number',
	packerPackageNotLoaded = 'Ignore',
	packerStatusFail = 'Statement',
	packerStatusSuccess = 'packerStatusFail',
	packerSuccess = function(self) return {fg=green, style=self.packerFail.style} end,

	--[[ 4.4.18. nvim-tree ]]
	NvimTreeGitDeleted = function(self) return {fg=self.DiffDelete.bg, bg=NONE} end,
	NvimTreeGitDirty = {fg=orange, bg=NONE},
	NvimTreeGitIgnored = 'Ignore',
	NvimTreeGitMerge = 'NvimTreeGitRenamed',
	NvimTreeGitNew = function(self) return {fg=self.DiffAdd.bg, bg=NONE} end,
	NvimTreeGitRenamed = function(self) return {fg=self.DiffChange.bg, bg=NONE} end,
	NvimTreeGitStaged = {fg=cyan, bg=NONE},
}

--[[ Step 5: Terminal Colors
	Define the color palette used by :terminal when in GUI Vim
	or in TUI Vim when 'termguicolors' is enabled. If this list
	is empty or if it doesn't contain exactly 16 items, the corresponding
	Vim variable won't be set.

	The expected values are colors defined in step 3.

	Terminal emulators use a basic palette of 16 colors that can be
	addressed by CLI and TUI tools via their name or their index, from
	0 to 15. The list is not really standardized but it is generally
	assumed to look like this:

	 | Index  | Name          |
	 |:------:|:-------------:|
	 | 1      | black         |
	 | 2      | darkred       |
	 | 3      | darkgreen     |
	 | 4      | darkyellow    |
	 | 5      | darkblue      |
	 | 6      | darkmagenta   |
	 | 7      | darkcyan      |
	 | 8      | gray          |
	 | 9      | darkgray      |
	 | 10     | red           |
	 | 11     | green         |
	 | 12     | yellow        |
	 | 13     | blue          |
	 | 14     | magenta       |
	 | 15     | cyan          |
	 | 16     | white         |

	While you are certainly free to make colors 0 to 7 shades of blue,
	this will inevitably cause usability issues so… be careful.
]]

local terminal_colors = {
	[1]  = black,
	[2]  = red,
	[3]  = green,
	[4]  = orange,
	[5]  = blue,
	[6]  = magenta,
	[7]  = cyan,
	[8]  = white,
	[9]  = gray_dark,
	[10] = red_light,
	[11] = green_light,
	[12] = orange_light,
	[13] = blue_light,
	[14] = magenta_light,
	[15] = cyan_light,
	[16] = white_light
}

--[[ Step 5: Sourcing
	When you wish to load your colorscheme, simply add this folder with a plugin manager
	and then use `colorscheme <your colorscheme name>`. For example, in my configuration,
	I source orange-dark by using `colorscheme orange-dark`.

	These online resources can help you design your colorscheme:

	1. the xterm palette.
		* http://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
	2. play with hexadecimal colors right in the address bar (currently down).
		* http://whatcolor.herokuapp.com/
	3. similar concept, fuzzier implementation.
		* http://color.hailpixel.com/
	4. similar concept, fancier implementation.
		* http://colourco.de/
	5. extract a palette from an image.
		* http://www.colr.org/
	6. search for 'word', get images and color palettes.
		* http://colores.manugarri.com/
	7. user-created palettes.
		* http://www.colourlovers.com/palettes
	8. a no-nonsense colorscheme generator.
		* http://www.pluaang.dk/color+scheme/
	9. Adobe's fancy colorscheme generator.
		* https://color.adobe.com/
	10. The classic 'Color Scheme Designer', rebranded.
		* http://paletton.com/
	11. A very smart palette generator.
		* http://vrl.cs.brown.edu/color
	12. 'I Made My Own Colour Scheme and You Can Too!'.
		* https://cmcenroe.me/2018/04/03/colour-scheme.html

	A few things to note:

	* The Windows console (`cmd`) is limited to the 16 so-called 'ANSI' colors but it used to
			have a few of them interverted which makes numbers impractical. Use color names
			instead of numbers: :help cterm-colors
		* The Windows console doesn't do italics, underlines or bolded text;
			it is limited to normal and reverse. Keep that in mind if you want
			your colorscheme to be usable in as many environments as possible by as many
			people as possible.
		* The Windows TERMINAL, however, is capable of more.
	* All of the terminal emulators in use these days allow their users to
		change the 16 so-called 'ANSI' colors. It is also possible on some platforms
		to change some or all of the 256 colors in the xterm palette. Don't take
		anything for granted.
	* When used against a light background, strong colors work better than muted
		ones. Light or dark doesn't really matters. Also, it is harder to discriminate
		between two similar colors on a light background.
	* Both strong and muted colors work well against a dark background. It is also
		easier to work with similar colors, but dark colors don't work at all.
	* Use as many text samples as possible. String-heavy languages may look completely
		different than keyword-heavy ones. This can have an impact on the usability
		of your colorscheme.
	* Most terminal emulators and terminal multiplexers currently in use on unix-like
		systems support 256 colors but they almost always default to a '$TERM' that tells
		Vim otherwise. Your users will need to make sure their terminal emulator/multiplexer
		is correctly set up if they want to enjoy the best possible experience.
]]

require(vim.g.colors_name)(
	highlight_group_normal,
	highlight_groups,
	terminal_colors
)

-- Thanks to Romain Lafourcade (https://github.com/romainl) for the original template (romainl/vim-rnb).