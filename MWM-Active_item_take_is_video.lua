--[[
     Active item take is video
     v 1.0
     
     Lua 5.2 compatible
     
     Utility function to determine if the active take of a Reaper Media Item contains video.
     ----------------------------------------------------
     Checks if the source is a video format of an active take of a Reaper Media Item.

     Parameters:
     - item (MediaItem) : The Reaper Media Item.

     Returns:
     - (boolean) : True if the active take contains video, false otherwise.
     ----------------------------------------------------
     
     Licensed under the same terms as Lua itself.
     
     MIT License

     Copyright (c) 2024 Mount West Music AB
]]--

function Active_item_take_is_video(item)
	if item == nil then return false end
	local take = reaper.GetActiveTake(item)
	local source = reaper.GetMediaItemTake_Source(take)
	local typebuf = reaper.GetMediaSourceType(source)
	if typebuf == "SECTION" then
		source = reaper.GetMediaSourceParent(source)
		typebuf = reaper.GetMediaSourceType(source)
	end
	if typebuf == "VIDEO" then
		return true
	else
		return false
	end
end