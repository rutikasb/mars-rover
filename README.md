# MARS ROVERS

There are 3 rake tasks:
```
$rake -T
rake spec  # Run RSpec code examples
rake test  # Run the app with input from file or in interactive mode
```

 - The spec task runs all the unit tests
 - The test task expects user input, either provided via command line or
 from a file directed using | or <

### Example usage
```
$cat input.txt | rake test
=> 1 3 N
   5 1 E
```

```
$rake test
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
<Ctrl + D>
=> 1 3 N
   5 1 E
```
