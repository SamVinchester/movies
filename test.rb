def test_method (arg)
	arg.each_key{|key| puts key}
end
test_method(foo: 'bar', foo2: 'bar2')