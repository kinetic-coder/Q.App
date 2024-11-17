namespace Q.App.Api.Models
{
    public class BaseResponseModel
    {
        public required int Id { get; set; }
        public BaseResponseModel() {
            Id = 0;
        }

    }
}
