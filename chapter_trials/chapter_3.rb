require 'pry'
NUM_LOCKERS =138

# class invariant = num lockers cannot be zero, must be integer strinct above 0


class Storage
	attr_accessor :lockerIsRented, :numLockersAvailable
	#set up the locker room data structures
	def initialize
		@lockerIsRented = Array.new(NUM_LOCKERS, false)
		@numLockersAvailable = NUM_LOCKERS
	end

	#find an empty array, mark it rented, return its numver
	def rentLocker
		if isFull?
			puts "we are full tonight.."
		else
			puts 'sounds like you are in luck'
			i = 0
			@lockerIsRented.each do |locker|
				if !locker
					locker_gotten = i
					@lockerIsRented[locker_gotten] = true
					break
				end
				puts "locker #{locker_gotten} is now yours"
				i = i+1
			end
		@numLockersAvailable = @numLockersAvailable - 1
		lockers_available
		end
	end

	# Mark a locker as no longer rented
	def releaseLocker(lockerNumber)
		@lockerIsRented[lockerNumber] = false
		@numLockersAvailable = @numLockersAvailable + 1
		puts "#{lockerNumber} is now free"
		lockers_available
	end

	#say wether any lokcer is for rented
	def isFree(lockerNumber)
		if @lockerIsRented[lockerNumber]
			true
		else
			false
		end
	end

	#Say wether any locker are left to rented
	def isFull?
		if @numLockersAvailable >= 0
			false
		else
			true
		end
	end

	def lockers_available
		puts  "lockers available #{@numLockersAvailable}"
	end
end

pry



