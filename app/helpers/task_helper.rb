module TaskHelper
    # def display_artist(song)
    #     song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
    #   end
    
      # Display dropdown of artists, with name if editing through nested
      def task_select(subtask, path)
        if subtask.task && path =~ /.*tasks.*subtasks.*/
          select_tag "subtask[task_id]", options_from_collection_for_select(Task.where(id: subtask.task_id), :id, :title)
        else
          select_tag "subtask[task_id]", options_from_collection_for_select(Task.all, :id, :title), :include_blank => true 
        end
      end
    
      # Display name if editing through nested
    #   def display_name(song, path)
    #     if song.artist && path == "nested"
    #       song.artist.name
    #     end
    #   end
end
