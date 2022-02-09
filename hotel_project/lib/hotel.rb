require_relative "room"

class Hotel
    attr_accessor :name, :hash


    def initialize (name, hash) #hash[room names] => capacities
        @name = name 
        @room_names = hash.keys
        @capacities_array = hash.values
        @rooms = Hash.new ()
        @room_names.each_with_index do |ele,i|
            rooms[ele] = Room.new(@capacities_array[i])
        end
        
    end 
    def name 
        x = @name.split(' ').map do |w|
            w.capitalize
        end
        x.join(' ')
    end
    def rooms 
        return @rooms
    end

    def room_exists? (name)
        if rooms.has_key?(name)
            return true
        else
            return false 
        end 
    end 

    def check_in (person, room_name)
        if self.room_exists?(room_name)
            p 'sorry, room does not exist'
            if rooms[room_name].add_occupant(person)
                p 'check in successful'
            end
        else
            p 'sorry, room does not exist'
            return false
        end
    end


    def has_vacancy?
        vacancy = true
        rooms.each do |k,v|
            if !v.full?
                return true
            end
        
        end
        return false 
    end

    def list_rooms 
        @rooms.each do |k,v|
            puts k.to_s + v.available_space.to_s
        end

    end



end
