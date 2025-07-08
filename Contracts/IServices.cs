namespace LibrarySystem.Contracts
{
    public interface IServices
    {
        Task<string> GetSOFQuestions();
        Task<string> GetSOFAnswerss(int questionId);
    }
}
