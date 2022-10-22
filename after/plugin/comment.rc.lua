local status, comment = pcall(require, "Comment")
if (not status) then return end
local status1, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
if (not status1) then return end

comment.setup {
  pre_hook = commentstring.create_pre_hook()
}
