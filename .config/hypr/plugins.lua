local colors = require("noctalia").colors


if hl.plugin.hyprbars ~= nil then
  hl.config({
      plugin = {
          hyprbars = {
            enabled = false,
              bar_height = 30,
              bar_color = colors.primary,
              bar_text_size = 15,
              bar_precedence_over_border = true,
              on_double_click = "hyprctl dispatch fullscreen 1",
          },
      },
  })

  -- Needs investigation
  hl.window_rule({match = {
    tag = "!has-bar",
    "hyprbars:no_bar"
  }})
end


if hl.plugin.hyprgrass ~= nil then

end


if hl.plugin.hyprexpo ~= nil then
  hl.config({
    plugin = {
        hyprexpo = {
            columns = 3,
            gaps_in = 5,
            gaps_out = 0,
            bg_col = "rgb(111111)",
            workspace_method = "center current",
            gesture_distance = 200,
            cancel_key = "escape",
            show_cursor = 1,
            drag_drop_enable = 0, -- Disable moving windows by dragging workspace previews.
        },
    },
})
end
