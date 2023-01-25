class Card
    attr_reader :face_up

    # the two pieces of info
    def initialize(face_value)
        @face_value = face_value
        @face_up = false
    end

    # display info
    def display_value
        @face_value if @face_up
    end

    # flip to face down
    def hide
        @face_up = false
    end

    # flip to face up
    def reveal
        @face_up = true
    end

    # use face_value as basis of equality
    def ==(other)
        self.display_value == other.display_value
    end

    def to_s
        if face_up
            @face_value
        else
            " "
        end
    end

end