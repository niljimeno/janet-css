# janet-css
Library for converting Janet code into CSS,
inspired by [scheicss](https://codeberg.org/naori/scheicss).

## Usage
```janet
(import janet-css/css)

(css/into-css
 [:body
  [:color "black"]
  [:h1
   [:color "red"]]]
 [:root
  [:color "purple"]]))

# => body {
#        color: black;
#    }
#
#    body h1 {
#        color: red;
#    }
#
#    :root {
#        color: purple;
#    }

```

## Setup
Add janet-css as a dependency to your `project.janet` file:
```janet
(declare-project
  ...
  :dependencies ["https://github.com/niljimeno/janet-css"])
```

Then run:
```sh
jpm deps
```
