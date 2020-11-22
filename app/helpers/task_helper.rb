module TaskHelper
    # def display_artist(song)
    #     song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
    #   end
    
      # Display dropdown of artists, with name if editing through nested
      def task_select(subtask, path)
        if subtask.task && path =~ /.*tasks.*subtasks.*/
         text_field_tag "subtask[task_id]", subtask.task.title, :readonly => true
        else
         select_tag "subtask[task_id]", options_from_collection_for_select(Task.all, :id, :title)
        end
      end
    
      # Display name if editing through nested
    #   def display_name(song, path)
    #     if song.artist && path == "nested"
    #       song.artist.name
    #     end
    #   end
end
