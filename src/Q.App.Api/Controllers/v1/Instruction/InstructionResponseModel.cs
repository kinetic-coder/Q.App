using Q.App.Api.Models;

namespace Q.App.Api.Controllers.v1.Instruction
{
    public class InstructionResponseModel : BaseResponseModel
    {
        public required string Comment { get; set; }
    }
}
