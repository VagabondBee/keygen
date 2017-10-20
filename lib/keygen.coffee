{CompositeDisposable} = require 'atom'
random = require './random'

module.exports = {
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'keygen:generate': => @generate()

  deactivate: ->
    @subscriptions.dispose()

  generate: ->
    editor = atom.workspace.getActiveTextEditor()
    if editor
      editor.insertText(random.RandomCharacterGenerator())
}
