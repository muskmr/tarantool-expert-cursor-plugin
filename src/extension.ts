import * as vscode from 'vscode';

export function activate(context: vscode.ExtensionContext): void {
  const disposable = vscode.commands.registerCommand('hello-cursor.helloWorld', () => {
    vscode.window.showInformationMessage('Hello World from Hello Cursor!');
  });

  context.subscriptions.push(disposable);
}

export function deactivate(): void {
  // no-op
}
