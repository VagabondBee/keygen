'use babel';

import KeygenView from './keygen-view';
import { CompositeDisposable } from 'atom';

export default {

  keygenView: null,
  modalPanel: null,
  subscriptions: null,

  activate(state) {
    this.keygenView = new KeygenView(state.keygenViewState);
    this.modalPanel = atom.workspace.addModalPanel({
      item: this.keygenView.getElement(),
      visible: false
    });

    // Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    this.subscriptions = new CompositeDisposable();

    // Register command that toggles this view
    this.subscriptions.add(atom.commands.add('atom-workspace', {
      'keygen:toggle': () => this.toggle()
    }));
  },

  deactivate() {
    this.modalPanel.destroy();
    this.subscriptions.dispose();
    this.keygenView.destroy();
  },

  serialize() {
    return {
      keygenViewState: this.keygenView.serialize()
    };
  },

  toggle() {
    console.log('Keygen was toggled!');
    return (
      this.modalPanel.isVisible() ?
      this.modalPanel.hide() :
      this.modalPanel.show()
    );
  }

};
