using System.ComponentModel.DataAnnotations;

namespace TY.test1.Models.ViewModels
{
	public class User
	{
		public int Id { get; set; }
		public required string AcpdSid { get; set; }

		public string AcpdCname { get; set; }

		public string AcpdEname { get; set; }

		public string AcpdSname { get; set; }

		public string AcpdEmail { get; set; }

		public byte AcpdStatus { get; set; }

		public bool AcpdStop { get; set; }

		public string AcpdStopMemo { get; set; }

		public string AcpdLoginId { get; set; }

		public string AcpdLoginPw { get; set; }

		public string AcpdMemo { get; set; }

		public DateTime AcpdNowdatetime { get; set; }

		public string AppdNowid { get; set; }

		public DateTime AcpdUpddatetitme { get; set; }

		public string AcpdUpdid { get; set; }
	}
}
