function RunBench(func, ...)
	local start_time = os.time()
	func(...)
	local end_time = os.time()
	local time = end_time - start_time
	return print(time)
end
