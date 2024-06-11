class Driver
  def initialize(steps, game, user)
    state.
  end

  def puts
    # Send a websocket message to the user and keep executing
  end

  def gets
    # If we are re-entering, we should return a value from this gets, otherwise, we should 
    # Save the state, remember which line of code needs to be run afterwards 
  end

  def execute()
    # Determine where to keep running everything from
    steps.each do |step|
      step.call(self.puts, self.gets)
    end
  end
end