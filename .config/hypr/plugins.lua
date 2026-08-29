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
