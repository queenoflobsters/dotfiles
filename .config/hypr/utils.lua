GAPS_IN = 8
GAPS_OUT = 20
GAPS_OUT_TOP = 14
ROUNDING = 10

ADDITIONAL_CONFIG = string.format([=[

[bar.default]
border = "primary"
border_width = 1.0
margin_edge = %d
margin_ends = %d
padding = 16
radius = 12
thickness = 40
]=], GAPS_OUT_TOP, GAPS_OUT)

local function read_file(filename)
    local file, err = io.open(filename, "r")
    if not file then return nil, err end
    local content = file:read("*a")
    file:close()
    return content
end

local function append_content(filename, target_str, avoid_duplicates)
    local content = read_file(filename)
    if content and content:find(target_str, 1, true) then
        return true
    end

    -- Open in append mode ("a" creates the file if it doesn't exist)
    local file, err = io.open(filename, "a")
    if not file then return false, err end
    file:write(target_str)
    file:close()
    return true
end


local function write_file(filename, content)
    local file, err = io.open(filename, "w")
    if not file then return nil, err end
    file:write(content)
    file:close()
    return true
end

local function remove_content(filename, target_str)
    local content, err = read_file(filename)
    if not content then return false, err end

    -- Plain string search & remove
    local parts = {}
    local last_pos = 1

    while true do
        local start_pos, end_pos = content:find(target_str, last_pos, true) -- `true` = plain match
        if not start_pos then
            table.insert(parts, content:sub(last_pos))
            break
        end
        table.insert(parts, content:sub(last_pos, start_pos - 1))
        last_pos = end_pos + 1
    end

    local new_content = table.concat(parts)
    return write_file(filename, new_content)
end


IsRounded = false

function ToggleGapsRounded()
  IsRounded = not IsRounded

  if IsRounded then
    append_content( "/home/gaybe/.local/state/noctalia/settings.toml", ADDITIONAL_CONFIG)
    hl.config({
      general = {
        gaps_in = GAPS_IN,
        gaps_out = { top = GAPS_OUT_TOP, right = GAPS_OUT, bottom = GAPS_OUT, left = GAPS_OUT}
      },
      decoration = {
        rounding = ROUNDING
      }
    })
  else
    remove_content( "/home/gaybe/.local/state/noctalia/settings.toml", ADDITIONAL_CONFIG)
    hl.config({
      general = {
        gaps_in = 0,
        gaps_out = 0
      },
      decoration = {
        rounding = 0
      }
    })
  end
end

function GetWorkspaces(i)
  local ws = hl.get_active_workspace()
  if ws.monitor.id == 0 then
    return i
  else
    if i <= 5 then
      return i + 5
    else
      return i - 5
    end
  end
end

