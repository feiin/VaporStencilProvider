# VaporStencilProvider
Adapter of Stencil Template Engine to Vapor ViewRenderer


## Using 

 **In main.swift**
```swift
import VaporStencilProvider
...
try drop.addProvider(VaporStencilProvider.self)

```

**myController.swift**

```swift
    ...
    return try drop.view.make("test.stencil", ["articles":articles])
    ...
```


## Stencil Document

[Stencil Tags](https://stencil.fuller.li/en/latest/builtins.html#built-in-tags)