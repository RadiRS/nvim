local status, package_info = pcall(require, 'package-info')
if (not status) then return end

package_info.setup({
  hide_up_to_date = true
})
