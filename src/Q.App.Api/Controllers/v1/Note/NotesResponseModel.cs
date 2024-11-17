using Q.App.Api.Models;

namespace Q.App.Api.Controllers.v1.Note
{
    public class NotesResponseModel : BaseResponseModel
    {
        public required string Comment { get; set; }

    }
}
