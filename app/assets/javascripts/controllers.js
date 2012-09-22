function NotebooksCtrl($scope, Notebook) {
  //Get the list of Notebooks
  $scope.notebooks = Notebook.query();

  //Create a new notebook
  $scope.createNotebook = function (notebook) {
    $scope.notebook = new Notebook();
    $scope.notebook.name = $scope.newNotebookName
    Notebook.save($scope.notebook, function(response){
      $scope.notebooks.push(response)
      $scope.newNotebookName = ""
    })
  }

  //Delete a notebook
  $scope.deleteNotebook = function(notebook){
    $scope.notebook = notebook
    Notebook.delete({id: notebook.id}, function(response){
      $scope.notebooks = _.filter($scope.notebooks, function(notebook){
        return !(notebook.id === $scope.notebook.id)
      })
    })
  }
}


function NotesCtrl($scope, $routeParams, Note) {
  //Query for list of notes in a notebook
  $scope.notes = Note.query({notebook_id: $routeParams.notebook_id})
  $scope.getNote = function(note){
   $scope.note = note
  }

  //Create new note
  $scope.createNote = function (note) {
    $scope.note.name = $scope.formNoteName
    $scope.note.message = ""
    Note.save({notebook_id: $routeParams.notebook_id}, $scope.note, function(response){
      $scope.notes.push(response)
      $scope.formNoteName = ""
      $scope.note = response
    })
  }


  //Update note
  $scope.syncNote = function(note){
    if($scope.note.name){
      $scope.note.$update({notebook_id: $scope.note.notebook_id, id: note.id})
    }
  }

  //Delete note
  $scope.deleteNote = function(note){
    if(note == $scope.note){
      $scope.note = {}
    }
    $scope.deletedNote = note
    Note.delete(note, function(response){
      $scope.notes = _.filter($scope.notes, function(note){
        return !(note.id === $scope.deletedNote.id)
      })
    })
  }


  $scope.clear = function(){
    $scope.note = new Note();
  }
}


