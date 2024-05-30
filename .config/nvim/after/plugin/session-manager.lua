local auto_session = require("auto-session")
local wk = require("which-key")

auto_session.setup({
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
})

wk.register({
	s = {
		name = "Session",
		s = { auto_session.AutoSaveSession, "Save session" },
		S = { auto_session.search_session, "Search session" },
		l = { auto_session.ListSessions, "List sessions" },
		d = { auto_session.DeleteSession, "Delete session" },
		r = { auto_session.RestoreSession, "Restore session" },
	},
}, { prefix = "<leader>" })
