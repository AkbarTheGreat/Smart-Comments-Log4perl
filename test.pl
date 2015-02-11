use Smart::Comments ('####', '###');
use Smart::Comments::Log4perl;

print "Line1\n";
my $foo = {'ak' => 'bar', 'baz' => 'plugh'};
#### log_config: 'sample.config'
### Foo: $foo
print "Line2\n";

for (1..10)
{ ## Sleeping ===[%]                    done
	#sleep 1;
}

