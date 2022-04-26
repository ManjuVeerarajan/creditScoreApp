package my.mobypay.creditScore;

public class SpaceCheck {

	public static void main(String[] args) {
	/*	String Experianmytext = "NUR SYAZANA SUHAILA BINTI     MOHD RIZAL";
		String userInput="NUR SYAZANA SUHAILA BINTI MOHD RIZAL";
		//without trim -> " hello there"
		//with trim -> "hello there"
		Experianmytext = Experianmytext.trim().replaceAll("[ ]{2,}", " ");
		System.out.println(Experianmytext);
		if(Experianmytext.equals(userInput)) {
			System.out.println("true");
		}
*/
		AWSS3Config awsS3 = new AWSS3Config();
		System.out.println(awsS3.getAmazonS3Cient());
	}

}
