--@diagnostic disable: undefined-global
describe("some basics", function()
	local bello = function(boo)
		return "bello " .. boo
	end

	local bounter

	before_each(function()
		bounter = 0
	end)

	it("some test", function()
		assert.equals("bello world", bello("world"))
	end)

	it("some other test", function()
		assert.equals(0, bounter)
	end)
end)
