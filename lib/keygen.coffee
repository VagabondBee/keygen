{CompositeDisposable} = require 'atom'
KeygenOptions = require './options'
CryptoRandomString = require 'crypto-random-string'
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
      editor.insertText(CryptoRandomString(KeygenOptions.get('keylength')));
}
