module.exports =
  class KeygenOptions
    @OPTIONS_PREFIX = 'keygen.'

    @get: (name) ->
      return atom.config.get(KeygenOptions.OPTIONS_PREFIX + name)

    @set: (name, value) ->
      atom.config.set(KeygenOptions.OPTIONS_PREFIX + name, value)

    @unset: (name) ->
      atom.config.unset(KeygenOptions.OPTIONS_PREFIX + name)

    constructor: () ->
      @initialize()

    initialize: () ->
      @keylength = KeygenOptions.get('keylength')
