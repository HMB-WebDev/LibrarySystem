using LibrarySystem.Contracts;

namespace LibrarySystem.Services
{
    public class Services : IServices
    {
        private readonly HttpClient _httpClient;
        public Services(HttpClient client)
        {
            _httpClient = client;
        }

        public async Task<string> GetSOFAnswerss(int questionId)
        {
            try
            {
                var client = new HttpClient();
                client.DefaultRequestHeaders.UserAgent.ParseAdd("LibrarySystem/1.0 (https://localhost:7135)");
                var response = await client.GetAsync("https://api.stackexchange.com/2.3/questions/" + questionId +"/answers?order=desc&sort=activity&site=stackoverflow&filter=withbody");
                if (response.IsSuccessStatusCode)
                {
                    var data = await response.Content.ReadAsStringAsync();
                    return data;
                }
                return "";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

        public async Task<string> GetSOFQuestions()
        {
            try
            {
                var client = new HttpClient();
                client.DefaultRequestHeaders.UserAgent.ParseAdd("LibrarySystem/1.0 (https://localhost:7135)");
                var response = await client.GetAsync("https://api.stackexchange.com/2.3/questions?order=desc&sort=activity&site=stackoverflow");
                if (response.IsSuccessStatusCode)
                {
                    var data = await response.Content.ReadAsStringAsync();                    
                    return data;
                }
                return "";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message,ex.InnerException);
            }
        }
    }
}
