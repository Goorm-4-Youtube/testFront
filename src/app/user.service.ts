import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private userId: string ='';

  constructor(private httpClient: HttpClient) { }

  subscribeToUser(userId: string): Observable<Boolean>{
    return this.httpClient.post<Boolean>("http://localhost:8080/api/user/subscribe/"+userId, null);
  }


  registerUser() {
    this.httpClient.get<string>("http://localhost:8080/api/user/register").subscribe( data => {
      this.userId = data;
    })
  }

  getUserId(): string{
    return this.userId;
  }
}
