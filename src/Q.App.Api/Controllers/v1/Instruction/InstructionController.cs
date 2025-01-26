using Microsoft.AspNetCore.Mvc;

namespace Q.App.Api.Controllers.v1.Instruction
{
    public class InstructionController : Controller
    {
        private static List<InstructionResponseModel> Instructions = new List<InstructionResponseModel>();

        [HttpGet("/v1/instruction/get")]
        public List<InstructionResponseModel> GetAllInstructions()
        {
            return Instructions;
        }

        [HttpGet("/v1/instruction/get{id}")]
        public InstructionResponseModel GetInstructionById(int id)
        {
            var instruction = Instructions.Find(l => l.Id.Equals(id));

            if (instruction is not null)
                return instruction;
            else
                return new InstructionResponseModel { Id = Guid.NewGuid(), Comment = "" };
        }

        [HttpPost("/v1/instruction/add")]
        public void Add(InstructionResponseModel model)
        {
            Instructions.Add(model);
        }

        [HttpDelete("/v1/instruction/delete{id}")]
        public ActionResult DeleteInstruction(int id)
        {
            var instructionToRemove = Instructions.Find(l => l.Id.Equals(id));

            if (instructionToRemove is not null)
            {
                Instructions.Remove(instructionToRemove);
                return Ok();
            }
            else
            {
                return NotFound($"Unable to locate the instruction with Id: {id}");
            }
        }
    }
}
