# Changelog

## 1.0.0

- Update multicodec table
- Implement `status` and `description`
- Remove `Struct` usage

## 0.2.1

- Fix deprecation warning in update rake task ([#3][pr-3])
- Update [multicodec table](https://github.com/SleeplessByte/ruby-multicodec/blob/master/lib/table.csv) ([#1][pr-1])
- Update dev dependency ([#2][pr-2])

[pr-1]: https://github.com/SleeplessByte/ruby-multicodec/pull/1
[pr-2]: https://github.com/SleeplessByte/ruby-multicodec/pull/2
[pr-3]: https://github.com/SleeplessByte/ruby-multicodec/pull/3

## 0.2.0

- Add tests for registry
- Add `where(tag:)` to create a _live_ sub selection of the registry
- Add `tags` to return the tags that exist
- Add `each(tag: nil)` to iterate the registry, optionally on a tag

## 0.1.0

:baby: initial release
