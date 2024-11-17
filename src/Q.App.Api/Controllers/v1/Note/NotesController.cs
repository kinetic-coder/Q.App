using Microsoft.AspNetCore.Mvc;

namespace Q.App.Api.Controllers.v1.Note
{
    public class NotesController : Controller
    {
        private static List<NotesResponseModel> Notes = new List<NotesResponseModel>();

        [HttpGet("/v1/note/get")]
        public List<NotesResponseModel> GetAllNotes()
        {
            return Notes;
        }

        [HttpGet("/v1/note/get{id}")]
        public NotesResponseModel GetNoteById(int id)
        {
            var note = Notes.Find(l => l.Id == id);

            if (note is not null)
                return note;
            else
                return new NotesResponseModel { Id = 0, Comment = "" };
        }

        [HttpPost("/v1/note/add")]
        public void Add(NotesResponseModel model)
        {
            Notes.Add(model);
        }

        [HttpDelete("/v1/note/delete{id}")]
        public ActionResult Delete(int id)
        {
            var noteToRemove = Notes.Find(l => l.Id == id);

            if (noteToRemove is not null)
            {
                Notes.Remove(noteToRemove);
                return Ok();
            }
            else
            {
                return NotFound($"Unable to locate the note with Id: {id}");
            }
        }
    }
}
