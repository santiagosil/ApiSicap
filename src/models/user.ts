export interface User{
    identification:string;
	password:string;
	name:string;
	lastname:string;
	gender_id:number;
	email:string;
	birthdate:Date;
	country_code:string;
	phone:string;
	occupation_id:number|null;
	postal_code:string;
	marital_status_id:number|null;
	geolocalitation:string;
	lat:number;
	lng:number;
	code:number;
	verification:boolean;
	sexual_orientation_id:number|null;
	educational_level_id :number|null;
	etnia_id:number|null;
}