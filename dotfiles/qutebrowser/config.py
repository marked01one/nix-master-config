import components.utils as utils
from components.interceptors import redirect_to_https, redirect_nix_shortcuts
from qutebrowser.api import interceptor
from qutebrowser.config.configfiles import ConfigAPI  # type: ignore
from qutebrowser.config.config import ConfigContainer  # type: ignore


config: ConfigAPI = config  # type: ignore
c: ConfigContainer = c  # type: ignore

config.load_autoconfig(True)

## =============================================================================
## ======== ALIASES ============================================================

c.aliases = {
  'q': 'close',
  'qa': 'quit',
  'w': 'session-save',
  'wq': 'quit --save',
  'wqa': 'quit --save'
}
c.auto_save.interval = 15000
c.auto_save.session = True
c.backend = 'webengine'

c.bindings.key_mappings = {
  '<Ctrl-[>': '<Escape>',
  '<Ctrl-6>': '<Ctrl-^>',
  '<Ctrl-M>': '<Return>',
  '<Ctrl-J>': '<Return>',
  '<Ctrl-I>': '<Tab>',

  '<Shift-Return>': '<Return>',
  '<Enter>': '<Return>',
  '<Shift-Enter>': '<Return>',
  '<Ctrl-Enter>': '<Ctrl-Return>'
}

## =============================================================================
## ======== CHANGELOG ==========================================================

c.changelog_after_upgrade = 'minor'

## =============================================================================
## ======== CONTEXT MENU COLORS ================================================

c.colors.completion.category.bg = utils.clean('''
qlineargradient(x1:0, y1:0, x2:0, y2:1,
  stop:0 #888888, stop:1 #505050
)''')
c.colors.completion.category.border.bottom = 'black'
c.colors.completion.category.border.top = 'black'
c.colors.completion.category.fg = 'white'

c.colors.completion.even.bg = '#333333'

c.colors.completion.fg = ['white', 'white', 'white']

c.colors.completion.item.selected.bg = '#e8c000'
c.colors.completion.item.selected.border.bottom = '#bbbb00'
c.colors.completion.item.selected.border.top = '#bbbb00'
c.colors.completion.item.selected.fg = 'black'
c.colors.completion.item.selected.match.fg = '#ff4444'

c.colors.completion.match.fg = '#ff4444'

c.colors.completion.odd.bg = '#444444'

c.colors.completion.scrollbar.bg = '#333333'
c.colors.completion.scrollbar.fg = 'white'

## =============================================================================
## ======== CONTEXT MENU COLORS ================================================

c.colors.contextmenu.disabled.bg = None
c.colors.contextmenu.disabled.fg = None

c.colors.contextmenu.menu.bg = None
c.colors.contextmenu.menu.fg = None

c.colors.contextmenu.selected.bg = None
c.colors.contextmenu.selected.fg = None

## =============================================================================
## ======== DOWNLOADS BAR COLORS ===============================================

c.colors.downloads.bar.bg = 'black'

c.colors.downloads.error.bg = 'red'
c.colors.downloads.error.fg = 'white'

c.colors.downloads.start.bg = '#0000aa'
c.colors.downloads.start.fg = 'white'

c.colors.downloads.stop.bg = '#00aa00'
c.colors.downloads.stop.fg = 'white'

c.colors.downloads.system.bg = 'rgb'
c.colors.downloads.system.fg = 'rgb'

## =============================================================================
## ======== HINTS COLORS =======================================================

c.colors.hints.bg = utils.clean("""
qlineargradient(x1:0, y1:0, x2:0, y2:1,
  stop:0 rgba(255, 247, 133, 0.8),
  stop:1 rgba(255, 197, 66, 0.8)
)""")
c.colors.hints.fg = 'black'
c.colors.hints.match.fg = 'green'

## =============================================================================
## ======== KEYHINTS COLORS ====================================================
c.colors.keyhint.bg = 'rgba(0, 0, 0, 80%)'
c.colors.keyhint.fg = '#FFFFFF'

c.colors.keyhint.suffix.fg = '#FFFF00'

c.colors.messages.error.bg = 'red'
c.colors.messages.error.border = '#bb0000'
c.colors.messages.error.fg = 'white'

c.colors.messages.info.bg = 'black'
c.colors.messages.info.border = '#333333'
c.colors.messages.info.fg = 'white'

c.colors.messages.warning.bg = 'darkorange'
c.colors.messages.warning.border = '#d47300'
c.colors.messages.warning.fg = 'black'

c.colors.prompts.bg = '#444444'
c.colors.prompts.border = '1px solid gray'
c.colors.prompts.fg = 'white'

c.colors.prompts.selected.bg = 'grey'
c.colors.prompts.selected.fg = 'white'

## =============================================================================
## ========= STATUS BAR COLORS =================================================
c.colors.statusbar.caret.bg = 'purple'
c.colors.statusbar.caret.fg = 'white'

c.colors.statusbar.caret.selection.bg = '#a12dff'
c.colors.statusbar.caret.selection.fg = 'white'

c.colors.statusbar.command.bg = 'black'
c.colors.statusbar.command.fg = 'white'
c.colors.statusbar.command.private.bg = 'darkslategray'
c.colors.statusbar.command.private.fg = 'white'

c.colors.statusbar.insert.bg = 'darkgreen'
c.colors.statusbar.insert.fg = 'white'

c.colors.statusbar.normal.bg = 'black'
c.colors.statusbar.normal.fg = 'white'

c.colors.statusbar.passthrough.bg = 'darkblue'
c.colors.statusbar.passthrough.fg = 'white'

c.colors.statusbar.private.bg = '#666666'
c.colors.statusbar.private.fg = 'white'

c.colors.statusbar.progress.bg = 'white'

c.colors.statusbar.url.error.fg = 'orange'
c.colors.statusbar.url.fg = 'white'
c.colors.statusbar.url.hover.fg = 'aqua'
c.colors.statusbar.url.success.http.fg = 'white'
c.colors.statusbar.url.success.https.fg = 'lime'
c.colors.statusbar.url.warn.fg = 'yellow'

## =============================================================================
## ========= TABS COLORS =======================================================

c.colors.tabs.bar.bg = '#555555'
c.colors.tabs.even.bg = 'darkgrey'
c.colors.tabs.even.fg = 'white'

c.colors.tabs.indicator.error = '#ff0000'
c.colors.tabs.indicator.start = '#0000aa'
c.colors.tabs.indicator.stop = '#00aa00'
c.colors.tabs.indicator.system = 'rgb'

c.colors.tabs.odd.bg = 'grey'
c.colors.tabs.odd.fg = 'white'

c.colors.tabs.pinned.even.bg = 'darkseagreen'
c.colors.tabs.pinned.even.fg = 'white'
c.colors.tabs.pinned.odd.bg = 'seagreen'
c.colors.tabs.pinned.odd.fg = 'white'

c.colors.tabs.pinned.selected.even.bg = 'black'
c.colors.tabs.pinned.selected.even.fg = 'white'
c.colors.tabs.pinned.selected.odd.bg = 'black'
c.colors.tabs.pinned.selected.odd.fg = 'white'

c.colors.tabs.selected.even.bg = 'black'
c.colors.tabs.selected.even.fg = 'white'
c.colors.tabs.selected.odd.bg = 'black'
c.colors.tabs.selected.odd.fg = 'white'

## =============================================================================
## ========= TOOLTIP COLORS ====================================================

c.colors.tooltip.bg = None
c.colors.tooltip.fg = None

## =============================================================================
## ========= WEBPAGE COLORS ====================================================

c.colors.webpage.bg = 'white'

c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.contrast = 0.0
c.colors.webpage.darkmode.enabled = False

c.colors.webpage.darkmode.policy.images = 'smart'
c.colors.webpage.darkmode.policy.page = 'smart'

c.colors.webpage.darkmode.threshold.background = 0
c.colors.webpage.darkmode.threshold.foreground = 256

c.colors.webpage.preferred_color_scheme = 'auto'


## =============================================================================
## ========= COMPLETION ========================================================

c.completion.cmd_history_max_items = 100
c.completion.delay = 0
c.completion.favorite_paths = []
c.completion.height = '50%'
c.completion.min_chars = 1

c.completion.open_categories = [
  'searchengines',
  'quickmarks',
  'bookmarks',
  'history',
  'filesystem',
]

c.completion.quick = True
c.completion.scrollbar.padding = 2
c.completion.scrollbar.width = 12
c.completion.show = 'always'
c.completion.shrink = False
c.completion.timestamp_format = '%Y-%m-%d %H:%M'
c.completion.use_best_match = False

c.completion.web_history.exclude = []
c.completion.web_history.max_items = -1

## =============================================================================
## ========= CONFIRM QUIT ======================================================

c.confirm_quit = ['never']

## =============================================================================
## ========= CONTENT SETTINGS ==================================================

c.content.autoplay = True

c.content.blocking.adblock.lists = [
  'https://easylist.to/easylist/easylist.txt',
  'https://easylist.to/easylist/easyprivacy.txt'
]
c.content.blocking.enabled = True
c.content.blocking.hosts.block_subdomains = True
c.content.blocking.hosts.lists = [
  'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts'
]
c.content.blocking.method = 'auto'
c.content.blocking.whitelist = []

c.content.cache.appcache = True
c.content.cache.maximum_pages = 0
c.content.cache.size = None

c.content.canvas_reading = True
c.content.cookies.accept = 'all'
c.content.cookies.store = True
c.content.default_encoding = 'iso-8859-1'
c.content.desktop_capture = 'ask'
c.content.dns_prefetch = True
c.content.frame_flattening = False
c.content.fullscreen.overlay_timeout = 3000
c.content.fullscreen.window = False
c.content.geolocation = 'ask'

c.content.headers.accept_language = 'en-US,en;q=0.9'
c.content.headers.custom = {}
c.content.headers.do_not_track = True
c.content.headers.referer = 'same-domain'
c.content.headers.user_agent = utils.clean('''
  Mozilla/5.0 ({os_info})
  AppleWebKit/{webkit_version} (KHTML, like Gecko)
  {upstream_browser_key}/{upstream_browser_version_short}
  Safari/{webkit_version}
''')

c.content.hyperlink_auditing = False
c.content.images = True

c.content.javascript.alert = True
c.content.javascript.can_close_tabs = False
c.content.javascript.can_open_tabs_automatically = False
c.content.javascript.clipboard = 'ask'
c.content.javascript.enabled = True
c.content.javascript.legacy_touch_events = 'never'
c.content.javascript.log = {
  'unknown': 'debug',
  'info': 'debug',
  'warning': 'debug',
  'error': 'debug',
}
c.content.javascript.log_message.excludes = {
  'userscript:_qute_stylesheet': [
    utils.clean('''
      *Refused to apply inline style because it violates the following Content
      Security Policy directive: *
    '''),
  ],
}
c.content.javascript.log_message.levels = {
  'qute:*': ['error'],
  'userscript:GM-*': [],
  'userscript:*': ['error']
}
c.content.javascript.modal_dialog = False
c.content.javascript.prompt = True

c.content.local_content_can_access_file_urls = True
c.content.local_content_can_access_remote_urls = False
c.content.local_storage = True

c.content.media.audio_capture = 'ask'
c.content.media.audio_video_capture = 'ask'
c.content.media.video_capture = 'ask'

c.content.mouse_lock = 'ask'
c.content.mute = False
c.content.netrc_file = None

c.content.notifications.enabled = 'ask'
c.content.notifications.presenter = 'auto'
c.content.notifications.show_origin = True

c.content.pdfjs = False
c.content.persistent_storage = 'ask'
c.content.plugins = False
c.content.prefers_reduced_motion = False
c.content.print_element_backgrounds = True

c.content.private_browsing = False

c.content.proxy = 'system'
c.content.proxy_dns_requests = True
c.content.register_protocol_handler = 'ask'
c.content.site_specific_quirks.enabled = True
c.content.site_specific_quirks.skip = []
c.content.tls.certificate_errors = 'ask'
c.content.unknown_url_scheme_policy = 'allow-from-user-interaction'
c.content.user_stylesheets = []
c.content.webgl = True
c.content.webrtc_ip_handling_policy = 'all-interfaces'
c.content.xss_auditing = False

## =============================================================================
## ========= DOWNLOADS SETTINGS ================================================

c.downloads.location.directory = None
c.downloads.location.prompt = True
c.downloads.location.remember = True
c.downloads.location.suggestion = 'path'

c.downloads.open_dispatcher = None
c.downloads.position = 'top'
c.downloads.prevent_mixed_content = True
c.downloads.remove_finished = -1

## =============================================================================
## ========= EDITOR SETTINGS ===================================================

c.editor.command = ['gvim', '-f', '{file}', '-c', 'normal {line}G{column0}l']
c.editor.encoding = 'utf-8'
c.editor.remove_file = True

## =============================================================================
## ======== FILE SELECTION =====================================================

FILE_SELECT = {
  'folder': ['xterm', '-e', 'ranger', '--choosedir={}'],
  'multiple_files': ['xterm', '-e', 'ranger', '--choosedir={}'],
  'single_file': ['xterm', '-e', 'ranger', '--choosedir={}'],
}

c.fileselect.folder.command = FILE_SELECT['folder']
c.fileselect.handler = 'default'
c.fileselect.multiple_files.command = FILE_SELECT['multiple_files']
c.fileselect.single_file.command = FILE_SELECT['single_file']

## =============================================================================
## ======== FONTS ==============================================================

c.fonts.completion.category = 'bold default_size default_family'
c.fonts.completion.entry = 'default_size default_family'
c.fonts.contextmenu = None
c.fonts.debug_console = 'default_size default_family'
c.fonts.default_family = [
    "JetBrainsMono Nerd Font",
    "Noto Sans Mono CJK SC",  # CJK Fallback font.
]
c.fonts.default_size = '10pt'

c.fonts.downloads = 'default_size default_family'
c.fonts.hints = 'bold default_size default_family'
c.fonts.keyhint = 'default_size default_family'
c.fonts.messages.error = 'default_size default_family'
c.fonts.messages.info = 'default_size default_family'
c.fonts.messages.warning = 'default_size default_family'

c.fonts.prompts = 'default_size sans-serif'
c.fonts.statusbar = 'default_size default_family'
c.fonts.tabs.selected = 'default_size default_family'
c.fonts.tabs.unselected = 'default_size default_family'
c.fonts.tooltip = None

c.fonts.web.family.cursive = ''
c.fonts.web.family.fantasy = ''
c.fonts.web.family.fixed = ''

c.fonts.web.family.sans_serif = ''
c.fonts.web.family.serif = ''
c.fonts.web.family.standard = ''

c.fonts.web.size.default = 16
c.fonts.web.size.default_fixed = 13
c.fonts.web.size.minimum = 0
c.fonts.web.size.minimum_logical = 6

## =============================================================================
## ======== HINTS ==============================================================

c.hints.auto_follow = 'unique-match'
c.hints.auto_follow_timeout = 0
c.hints.border = '1px solid #E3BE23'
c.hints.chars = 'asdfghjkl'
c.hints.dictionary = '/usr/share/dict/words'
c.hints.find_implementation = 'python'
c.hints.hide_unmatched_rapid_hints = True
c.hints.leave_on_load = False
c.hints.min_chars = 1
c.hints.mode = 'letter'

c.hints.next_regexes = [
  '\\bnext\\b',
  '\\bmore\\b',
  '\\bnewer\\b',
  '\\b[>→≫]\\b',
  '\\b(>>|»)\\b',
  '\\bcontinue\\b',
]

c.hints.padding = {
  'top': 0,
  'bottom': 0,
  'left': 3,
  'right': 3,
}

c.hints.prev_regexes = [
  '\\bprev(ious)?\\b',
  '\\bback\\b',
  '\\bolder\\b',
  '\\b[<←≪]\\b',
  '\\b(<<|«)\\b',
]

c.hints.radius = 3
c.hints.scatter = True

c.hints.selectors = {
  'all': [
    'a', 'area', 'textarea', 'select', 'input:not([type="hidden"])',
    'button', 'frame', 'iframe', 'img', 'link', 'summary',
    '[contenteditable]:not([contenteditable="false"])', '[onclick]',
    '[onmousedown]', '[role="link"]', '[role="option"]', '[role="button"]',
    '[role="tab"]', '[role="checkbox"]', '[role="switch"]', '[role="menuitem"]',
    '[role="menuitemcheckbox"]', '[role="menuitemradio"]', '[role="treeitem"]',
    '[aria-haspopup]', '[ng-click]', '[ngClick]', '[data-ng-click]',
    '[x-ng-click]', '[tabindex]:not([tabindex="-1"])',
  ],
  'links': ['a[href]', 'area[href]', 'link[href]', '[role="link"][href]'],
  'images': ['img'],
  'media': ['audio', 'img', 'video'],
  'url': ['[src]', '[href]'],
  'inputs': [
    'input[type="text"]', 'input[type="date"]','input[type="datetime-local"]',
    'input[type="email"]', 'input[type="month"]', 'input[type="number"]',
    'input[type="password"]', 'input[type="search"]', 'input[type="tel"]',
    'input[type="time"]', 'input[type="url"]', 'input[type="week"]',
    'input:not([type])', '[contenteditable]:not([contenteditable="false"])',
    'textarea',
  ],
}

c.hints.uppercase = False

## =============================================================================
## ======== HISTORY GAP INTERVAL ===============================================

c.history_gap_interval = 30

## =============================================================================
## ======== INPUTS =============================================================

c.input.escape_quits_reporter = True
c.input.forward_unbound_keys = 'auto'

c.input.insert_mode.auto_enter = True
c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_load = False
c.input.insert_mode.leave_on_load = True
c.input.insert_mode.plugins = False

c.input.links_included_in_focus_chain = True
c.input.match_counts = True
c.input.media_keys = True
c.input.mode_override = None

c.input.mouse.back_forward_buttons = True
c.input.mouse.rocker_gestures = False

c.input.partial_timeout = 0
c.input.spatial_navigation = False

## =============================================================================
## ======== KEYHINTS ===========================================================

c.keyhint.blacklist = []
c.keyhint.delay = 500
c.keyhint.radius = 6
c.logging.level.console = 'info'
c.logging.level.ram = 'debug'
c.messages.timeout = 3000
c.new_instance_open_target = 'tab'
c.new_instance_open_target_window = 'last-focused'
c.prompt.filebrowser = True
c.prompt.radius = 8

## =============================================================================
## ======== QT SETTINGS ========================================================

c.qt.args = []
c.qt.chromium.experimental_web_platform_features = 'auto'
c.qt.chromium.low_end_device_mode = 'auto'
c.qt.chromium.process_model = 'process-per-site-instance'
c.qt.chromium.sandboxing = 'enable-all'
c.qt.environ = {}
c.qt.force_platform = None
c.qt.force_platformtheme = None
c.qt.force_software_rendering = 'none'
c.qt.highdpi = False

c.qt.workarounds.disable_accelerated_2d_canvas = 'auto'
c.qt.workarounds.disable_hangouts_extension = False
c.qt.workarounds.locale = False
c.qt.workarounds.remove_service_workers = False

## =============================================================================
## ======== SCROLLING ==========================================================

c.scrolling.bar = 'overlay'
c.scrolling.smooth = False

## =============================================================================
## ======== SEARCH =============================================================

c.search.ignore_case = 'smart'
c.search.incremental = True
c.search.wrap = True
c.search.wrap_messages = True

## =============================================================================
## ======== SESSIONS ===========================================================

c.session.default_name = None
c.session.lazy_restore = False

## =============================================================================
## ======== SPELLCHECKING ======================================================

c.spellcheck.languages = [
  'en-US',
  'en-GB',
  'vi-VN',
]

## =============================================================================
## ======== TAB SETTINGS =======================================================

c.statusbar.padding = {'top': 1, 'bottom': 1, 'left': 0, 'right': 0}
c.statusbar.position = 'bottom'
c.statusbar.show = 'always'
c.statusbar.widgets = [
  'keypress',
  'search_match',
  'url',
  'scroll',
  'history',
  'tabs',
  'progress',
]

## =============================================================================
## ======== TAB SETTINGS =======================================================

c.tabs.background = True
c.tabs.close_mouse_button = 'middle'
c.tabs.close_mouse_button_on_bar = 'new-tab'

c.tabs.favicons.scale = 1.0
c.tabs.favicons.show = 'always'

c.tabs.focus_stack_size = 10

c.tabs.indicator.padding = {'top': 2, 'bottom': 2, 'left': 0, 'right': 4}
c.tabs.indicator.width = 3

c.tabs.last_close = 'ignore'

c.tabs.max_width = -1
c.tabs.min_width = -1

c.tabs.mode_on_change = 'normal'
c.tabs.mousewheel_switching = True

c.tabs.new_position.related = 'next'
c.tabs.new_position.stacking = True
c.tabs.new_position.unrelated = 'last'

c.tabs.padding = {
  'top': 5,
  'bottom': 5,
  'left': 5,
  'right': 5
}

c.tabs.pinned.frozen = True
c.tabs.pinned.shrink = True

c.tabs.position = 'right'
c.tabs.select_on_remove = 'next'
c.tabs.show = 'always'
c.tabs.show_switching_delay = 800
c.tabs.tabs_are_windows = False

c.tabs.title.alignment = 'left'
c.tabs.title.elide = 'right'
c.tabs.title.format = '{current_title}'
c.tabs.title.format_pinned = '{index}'

c.tabs.tooltips = True
c.tabs.undo_stack_size = 100
c.tabs.width = '15%'
c.tabs.wrap = True

## =============================================================================
## ======== URL SETTINGS =======================================================

c.url.auto_search = 'naive'
c.url.default_page = 'https://start.duckduckgo.com/'
c.url.incdec_segments = ['path', 'query']
c.url.open_base_url = False
c.url.searchengines = {
  # Google Search shall not query AI results by default.
  'DEFAULT': 'https://google.com/search?q={}+-ai',
  'gg': 'https://google.com/search?q={}',
  'ddg': 'https://duckduckgo.com/',

  # NixOS search queries.
  # NOTE: We're using a blank URL as a redirector address for all Nix-related calls.
  'nix': 'https://nix.default-redirector/{}',

  # Wikipedia search queries.
  'wiki': 'https://en.wikipedia.org/w/index.php?search={}',
}
c.url.start_pages = ['https://start.duckduckgo.com']
c.url.yank_ignored_parameters = [
  'ref',
  'utm_source',
  'utm_medium',
  'utm_campaign',
  'utm_term',
  'utm_content',
  'utm_name'
]

## =============================================================================
## ======== WINDOW SETTINGS ====================================================

c.window.hide_decoration = False
c.window.title_format = '{perc}{current_title}{title_sep}qutebrowser'
c.window.transparent = False

## =============================================================================
## ======== ZOOMING ============================================================

c.zoom.default = '100%'
c.zoom.levels = [
    '25%', '33%', '50%', '67%', '75%', '90%', '100%',
    '110%', '125%', '150%', '175%', '200%', '250%',
    '300%', '400%', '500%'
]
c.zoom.mouse_divider = 512
c.zoom.text_only = False

## =============================================================================
## ======== NORMAL MODE BINDINGS ===============================================

config.bind("'", 'mode-enter jump_mark')
config.bind('+', 'zoom-in')
config.bind('-', 'zoom-out')
config.bind('.', 'cmd-repeat-last')
config.bind('/', 'cmd-set-text /')
config.bind(':', 'cmd-set-text :')
config.bind(';I', 'hint images tab')
config.bind(';O', 'hint links fill :open -t -r {hint-url}')
config.bind(';R', 'hint --rapid links window')
config.bind(';Y', 'hint links yank-primary')
config.bind(';b', 'hint all tab-bg')
config.bind(';d', 'hint links download')
config.bind(';f', 'hint all tab-fg')
config.bind(';h', 'hint all hover')
config.bind(';i', 'hint images')
config.bind(';o', 'hint links fill :open {hint-url}')
config.bind(';r', 'hint --rapid links tab-bg')
config.bind(';t', 'hint inputs')
config.bind(';y', 'hint links yank')
config.bind('<Alt-1>', 'tab-focus 1')
config.bind('<Alt-2>', 'tab-focus 2')
config.bind('<Alt-3>', 'tab-focus 3')
config.bind('<Alt-4>', 'tab-focus 4')
config.bind('<Alt-5>', 'tab-focus 5')
config.bind('<Alt-6>', 'tab-focus 6')
config.bind('<Alt-7>', 'tab-focus 7')
config.bind('<Alt-8>', 'tab-focus 8')
config.bind('<Alt-9>', 'tab-focus -1')
config.bind('<Alt-m>', 'tab-mute')
config.bind('<Ctrl-A>', 'navigate increment')
config.bind('<Ctrl-Alt-p>', 'print')
config.bind('<Ctrl-B>', 'scroll-page 0 -1')
config.bind('<Ctrl-D>', 'scroll-page 0 0.5')
config.bind('<Ctrl-F5>', 'reload -f')
config.bind('<Ctrl-F>', 'scroll-page 0 1')
config.bind('<Ctrl-N>', 'open -w')
config.bind('<Ctrl-PgDown>', 'tab-next')
config.bind('<Ctrl-PgUp>', 'tab-prev')
config.bind('<Ctrl-Q>', 'quit')
config.bind('<Ctrl-Return>', 'selection-follow -t')
config.bind('<Ctrl-Shift-N>', 'open -p')
config.bind('<Ctrl-Shift-T>', 'undo')
config.bind('<Ctrl-Shift-Tab>', 'nop')
config.bind('<Ctrl-Shift-W>', 'close')
config.bind('<Ctrl-T>', 'open -t')
config.bind('<Ctrl-Tab>', 'tab-focus last')
config.bind('<Ctrl-U>', 'scroll-page 0 -0.5')
config.bind('<Ctrl-V>', 'mode-enter passthrough')
config.bind('<Ctrl-W>', 'tab-close')
config.bind('<Ctrl-X>', 'navigate decrement')
config.bind('<Ctrl-^>', 'tab-focus last')
config.bind('<Ctrl-h>', 'home')
config.bind('<Ctrl-p>', 'tab-pin')
config.bind('<Ctrl-s>', 'stop')
config.bind('<Escape>', 'clear-keychain ;; search ;; fullscreen --leave')
config.bind('<F11>', 'fullscreen')
config.bind('<F5>', 'reload')
config.bind('<Return>', 'selection-follow')
config.bind('<back>', 'back')
config.bind('<forward>', 'forward')
config.bind('=', 'zoom')
config.bind('?', 'cmd-set-text ?')
config.bind('@', 'macro-run')
config.bind('B', 'cmd-set-text -s :quickmark-load -t')
config.bind('D', 'tab-close -o')
config.bind('F', 'hint all tab')
config.bind('G', 'scroll-to-perc')
config.bind('H', 'back')
config.bind('J', 'tab-next')
config.bind('K', 'tab-prev')
config.bind('L', 'forward')
config.bind('M', 'bookmark-add')
config.bind('N', 'search-prev')
config.bind('O', 'cmd-set-text -s :open -t')
config.bind('PP', 'open -t -- {primary}')
config.bind('Pp', 'open -t -- {clipboard}')
config.bind('R', 'reload -f')
config.bind('Sb', 'bookmark-list --jump')
config.bind('Sh', 'history')
config.bind('Sq', 'bookmark-list')
config.bind('Ss', 'set')
config.bind('T', 'cmd-set-text -sr :tab-focus')
config.bind('U', 'undo -w')
config.bind('V', 'mode-enter caret ;; selection-toggle --line')
config.bind('ZQ', 'quit')
config.bind('ZZ', 'quit --save')
config.bind('[[', 'navigate prev')
config.bind(']]', 'navigate next')
config.bind('`', 'mode-enter set_mark')
config.bind('ad', 'download-cancel')
config.bind('b', 'cmd-set-text -s :quickmark-load')
config.bind('cd', 'download-clear')
config.bind('co', 'tab-only')
config.bind('d', 'tab-close')
config.bind('f', 'hint')
config.bind('g$', 'tab-focus -1')
config.bind('g0', 'tab-focus 1')
config.bind('gB', 'cmd-set-text -s :bookmark-load -t')
config.bind('gC', 'tab-clone')
config.bind('gD', 'tab-give')
config.bind('gJ', 'tab-move +')
config.bind('gK', 'tab-move -')
config.bind('gO', 'cmd-set-text :open -t -r {url:pretty}')
config.bind('gU', 'navigate up -t')
config.bind('g^', 'tab-focus 1')
config.bind('ga', 'open -t')
config.bind('gb', 'cmd-set-text -s :bookmark-load')
config.bind('gd', 'download')
config.bind('gf', 'view-source')
config.bind('gg', 'scroll-to-perc 0')
config.bind('gi', 'hint inputs --first')
config.bind('gm', 'tab-move')
config.bind('go', 'cmd-set-text :open {url:pretty}')
config.bind('gt', 'cmd-set-text -s :tab-select')
config.bind('gu', 'navigate up')
config.bind('h', 'scroll left')
config.bind('i', 'mode-enter insert')
config.bind('j', 'scroll down')
config.bind('k', 'scroll up')
config.bind('l', 'scroll right')
config.bind('m', 'quickmark-save')
config.bind('n', 'search-next')
config.bind('o', 'cmd-set-text -s :open')
config.bind('pP', 'open -- {primary}')
config.bind('pp', 'open -- {clipboard}')
config.bind('q', 'macro-record')
config.bind('r', 'reload')
config.bind('sf', 'save')
config.bind('sk', 'cmd-set-text -s :bind')
config.bind('sl', 'cmd-set-text -s :set -t')
config.bind('ss', 'cmd-set-text -s :set')
config.bind('tCH', 'config-cycle -p -u *://*.{url:host}/* content.cookies.accept all no-3rdparty never ;; reload')
config.bind('tCh', 'config-cycle -p -u *://{url:host}/* content.cookies.accept all no-3rdparty never ;; reload')
config.bind('tCu', 'config-cycle -p -u {url} content.cookies.accept all no-3rdparty never ;; reload')
config.bind('tIH', 'config-cycle -p -u *://*.{url:host}/* content.images ;; reload')
config.bind('tIh', 'config-cycle -p -u *://{url:host}/* content.images ;; reload')
config.bind('tIu', 'config-cycle -p -u {url} content.images ;; reload')
config.bind('tPH', 'config-cycle -p -u *://*.{url:host}/* content.plugins ;; reload')
config.bind('tPh', 'config-cycle -p -u *://{url:host}/* content.plugins ;; reload')
config.bind('tPu', 'config-cycle -p -u {url} content.plugins ;; reload')
config.bind('tSH', 'config-cycle -p -u *://*.{url:host}/* content.javascript.enabled ;; reload')
config.bind('tSh', 'config-cycle -p -u *://{url:host}/* content.javascript.enabled ;; reload')
config.bind('tSu', 'config-cycle -p -u {url} content.javascript.enabled ;; reload')
config.bind('tcH', 'config-cycle -p -t -u *://*.{url:host}/* content.cookies.accept all no-3rdparty never ;; reload')
config.bind('tch', 'config-cycle -p -t -u *://{url:host}/* content.cookies.accept all no-3rdparty never ;; reload')
config.bind('tcu', 'config-cycle -p -t -u {url} content.cookies.accept all no-3rdparty never ;; reload')
config.bind('th', 'back -t')
config.bind('tiH', 'config-cycle -p -t -u *://*.{url:host}/* content.images ;; reload')
config.bind('tih', 'config-cycle -p -t -u *://{url:host}/* content.images ;; reload')
config.bind('tiu', 'config-cycle -p -t -u {url} content.images ;; reload')
config.bind('tl', 'forward -t')
config.bind('tpH', 'config-cycle -p -t -u *://*.{url:host}/* content.plugins ;; reload')
config.bind('tph', 'config-cycle -p -t -u *://{url:host}/* content.plugins ;; reload')
config.bind('tpu', 'config-cycle -p -t -u {url} content.plugins ;; reload')
config.bind('tsH', 'config-cycle -p -t -u *://*.{url:host}/* content.javascript.enabled ;; reload')
config.bind('tsh', 'config-cycle -p -t -u *://{url:host}/* content.javascript.enabled ;; reload')
config.bind('tsu', 'config-cycle -p -t -u {url} content.javascript.enabled ;; reload')
config.bind('u', 'undo')
config.bind('v', 'mode-enter caret')
config.bind('wB', 'cmd-set-text -s :bookmark-load -w')
config.bind('wIf', 'devtools-focus')
config.bind('wIh', 'devtools left')
config.bind('wIj', 'devtools bottom')
config.bind('wIk', 'devtools top')
config.bind('wIl', 'devtools right')
config.bind('wIw', 'devtools window')
config.bind('wO', 'cmd-set-text :open -w {url:pretty}')
config.bind('wP', 'open -w -- {primary}')
config.bind('wb', 'cmd-set-text -s :quickmark-load -w')
config.bind('wf', 'hint all window')
config.bind('wh', 'back -w')
config.bind('wi', 'devtools')
config.bind('wl', 'forward -w')
config.bind('wo', 'cmd-set-text -s :open -w')
config.bind('wp', 'open -w -- {clipboard}')
config.bind('xO', 'cmd-set-text :open -b -r {url:pretty}')
config.bind('xo', 'cmd-set-text -s :open -b')
config.bind('yD', 'yank domain -s')
config.bind('yM', 'yank inline [{title}]({url:yank}) -s')
config.bind('yP', 'yank pretty-url -s')
config.bind('yT', 'yank title -s')
config.bind('yY', 'yank -s')
config.bind('yd', 'yank domain')
config.bind('ym', 'yank inline [{title}]({url:yank})')
config.bind('yp', 'yank pretty-url')
config.bind('yt', 'yank title')
config.bind('yy', 'yank')
config.bind('{{', 'navigate prev -t')
config.bind('}}', 'navigate next -t')

## =============================================================================
## ======== CARET MODE BINDINGS ================================================

config.bind('$', 'move-to-end-of-line', mode='caret')
config.bind('0', 'move-to-start-of-line', mode='caret')
config.bind('<Ctrl-Space>', 'selection-drop', mode='caret')
config.bind('<Escape>', 'mode-leave', mode='caret')
config.bind('<Return>', 'yank selection', mode='caret')
config.bind('<Space>', 'selection-toggle', mode='caret')
config.bind('G', 'move-to-end-of-document', mode='caret')
config.bind('H', 'scroll left', mode='caret')
config.bind('J', 'scroll down', mode='caret')
config.bind('K', 'scroll up', mode='caret')
config.bind('L', 'scroll right', mode='caret')
config.bind('V', 'selection-toggle --line', mode='caret')
config.bind('Y', 'yank selection -s', mode='caret')
config.bind('[', 'move-to-start-of-prev-block', mode='caret')
config.bind(']', 'move-to-start-of-next-block', mode='caret')
config.bind('b', 'move-to-prev-word', mode='caret')
config.bind('c', 'mode-enter normal', mode='caret')
config.bind('e', 'move-to-end-of-word', mode='caret')
config.bind('gg', 'move-to-start-of-document', mode='caret')
config.bind('h', 'move-to-prev-char', mode='caret')
config.bind('j', 'move-to-next-line', mode='caret')
config.bind('k', 'move-to-prev-line', mode='caret')
config.bind('l', 'move-to-next-char', mode='caret')
config.bind('o', 'selection-reverse', mode='caret')
config.bind('v', 'selection-toggle', mode='caret')
config.bind('w', 'move-to-next-word', mode='caret')
config.bind('y', 'yank selection', mode='caret')
config.bind('{', 'move-to-end-of-prev-block', mode='caret')
config.bind('}', 'move-to-end-of-next-block', mode='caret')

## =============================================================================
## ======== COMMAND MODE BINDINGS ==============================================

config.bind('<Alt-B>', 'rl-backward-word', mode='command')
config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='command')
config.bind('<Alt-D>', 'rl-kill-word', mode='command')
config.bind('<Alt-F>', 'rl-forward-word', mode='command')
config.bind('<Ctrl-?>', 'rl-delete-char', mode='command')
config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='command')
config.bind('<Ctrl-B>', 'rl-backward-char', mode='command')
config.bind('<Ctrl-C>', 'completion-item-yank', mode='command')
config.bind('<Ctrl-D>', 'completion-item-del', mode='command')
config.bind('<Ctrl-E>', 'rl-end-of-line', mode='command')
config.bind('<Ctrl-F>', 'rl-forward-char', mode='command')
config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='command')
config.bind('<Ctrl-K>', 'rl-kill-line', mode='command')
config.bind('<Ctrl-N>', 'command-history-next', mode='command')
config.bind('<Ctrl-P>', 'command-history-prev', mode='command')
config.bind('<Ctrl-Return>', 'command-accept --rapid', mode='command')
config.bind('<Ctrl-Shift-C>', 'completion-item-yank --sel', mode='command')
config.bind('<Ctrl-Shift-Tab>', 'completion-item-focus prev-category', mode='command')
config.bind('<Ctrl-Shift-W>', 'rl-filename-rubout', mode='command')
config.bind('<Ctrl-Tab>', 'completion-item-focus next-category', mode='command')
config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='command')
config.bind('<Ctrl-W>', 'rl-rubout " "', mode='command')
config.bind('<Ctrl-Y>', 'rl-yank', mode='command')
config.bind('<Down>', 'completion-item-focus --history next', mode='command')
config.bind('<Escape>', 'mode-leave', mode='command')
config.bind('<PgDown>', 'completion-item-focus next-page', mode='command')
config.bind('<PgUp>', 'completion-item-focus prev-page', mode='command')
config.bind('<Return>', 'command-accept', mode='command')
config.bind('<Shift-Delete>', 'completion-item-del', mode='command')
config.bind('<Shift-Tab>', 'completion-item-focus prev', mode='command')
config.bind('<Tab>', 'completion-item-focus next', mode='command')
config.bind('<Up>', 'completion-item-focus --history prev', mode='command')

#Bindings for hint mode
config.bind('<Ctrl-B>', 'hint all tab-bg', mode='hint')
config.bind('<Ctrl-F>', 'hint links', mode='hint')
config.bind('<Ctrl-R>', 'hint --rapid links tab-bg', mode='hint')
config.bind('<Escape>', 'mode-leave', mode='hint')
config.bind('<Return>', 'hint-follow', mode='hint')

#Bindings for insert mode
config.bind('<Ctrl-E>', 'edit-text', mode='insert')
config.bind('<Escape>', 'mode-leave', mode='insert')
config.bind('<Shift-Escape>', 'fake-key <Escape>', mode='insert')
config.bind('<Shift-Ins>', 'insert-text -- {primary}', mode='insert')

#Bindings for passthrough mode
config.bind('<Shift-Escape>', 'mode-leave', mode='passthrough')

#Bindings for prompt mode
config.bind('<Alt-B>', 'rl-backward-word', mode='prompt')
config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='prompt')
config.bind('<Alt-D>', 'rl-kill-word', mode='prompt')
config.bind('<Alt-E>', 'prompt-fileselect-external', mode='prompt')
config.bind('<Alt-F>', 'rl-forward-word', mode='prompt')
config.bind('<Alt-Shift-Y>', 'prompt-yank --sel', mode='prompt')
config.bind('<Alt-Y>', 'prompt-yank', mode='prompt')
config.bind('<Ctrl-?>', 'rl-delete-char', mode='prompt')
config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='prompt')
config.bind('<Ctrl-B>', 'rl-backward-char', mode='prompt')
config.bind('<Ctrl-E>', 'rl-end-of-line', mode='prompt')
config.bind('<Ctrl-F>', 'rl-forward-char', mode='prompt')
config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='prompt')
config.bind('<Ctrl-K>', 'rl-kill-line', mode='prompt')
config.bind('<Ctrl-P>', 'prompt-open-download --pdfjs', mode='prompt')
config.bind('<Ctrl-Shift-W>', 'rl-filename-rubout', mode='prompt')
config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='prompt')
config.bind('<Ctrl-W>', 'rl-rubout " "', mode='prompt')
config.bind('<Ctrl-X>', 'prompt-open-download', mode='prompt')
config.bind('<Ctrl-Y>', 'rl-yank', mode='prompt')
config.bind('<Down>', 'prompt-item-focus next', mode='prompt')
config.bind('<Escape>', 'mode-leave', mode='prompt')
config.bind('<Return>', 'prompt-accept', mode='prompt')
config.bind('<Shift-Tab>', 'prompt-item-focus prev', mode='prompt')
config.bind('<Tab>', 'prompt-item-focus next', mode='prompt')
config.bind('<Up>', 'prompt-item-focus prev', mode='prompt')

#Bindings for register mode
config.bind('<Escape>', 'mode-leave', mode='register')

#Bindings for yesno mode
config.bind('<Alt-Shift-Y>', 'prompt-yank --sel', mode='yesno')
config.bind('<Alt-Y>', 'prompt-yank', mode='yesno')
config.bind('<Escape>', 'mode-leave', mode='yesno')
config.bind('<Return>', 'prompt-accept', mode='yesno')
config.bind('N', 'prompt-accept --save no', mode='yesno')
config.bind('Y', 'prompt-accept --save yes', mode='yesno')
config.bind('n', 'prompt-accept no', mode='yesno')
config.bind('y', 'prompt-accept yes', mode='yesno')

# Bindings to hide tabs
config.bind('xt', 'config-cycle tabs.show always switching')

## =============================================================================
## ======== SITE SPECIFIC EXCEPTIONS ===========================================


## =============================================================================
## ======== REQUEST INTERCEPTORS ===============================================

interceptor.register(redirect_to_https)
interceptor.register(redirect_nix_shortcuts)
