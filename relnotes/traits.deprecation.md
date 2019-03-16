### Deprecation of `ocean.core.Traits`

`ocean.core.TypeConvert`

Now contains `toDg` utility previously present in `ocean.core.Traits`

`ocean.meta.codegen.Identifier`

Deprecated `fieldIdentifier` because in D2 it is possible to use plain
`identifier` template from the same module in all relevant cases.

`ocean.meta.traits.Aggregates`

Now provides `totalMemberSize` trait which calculates sum of individual sizes
of all aggregate members (non-recursively).

`ocean.meta.traits.Arrays`

Now contains `rankOfArray` utility previously present in `ocean.core.Traits`.

`ocean.meta.types.Enum`

New module providing `EnumBaseType` utility that reduces enum type to its base
type.