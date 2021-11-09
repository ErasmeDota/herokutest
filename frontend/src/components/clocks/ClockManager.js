import axios from "axios";

const baseUrl = 'http://localhost:4000/api';

class ClockManager {

  constructor(){

    this.clockIn = true;
    this.startDateTime = null;
  }

  clock()
  {
    this.clockIn = true;
    this.startDateTime = this.getDateTime();
  }

  refresh()
  {
    this.clockIn = false;
    this.startDateTime = null;
  }

  getDateTime()
  {
    let today = new Date();
    let date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    let time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    let CurrentDateTime = date+' '+time;
    
    return CurrentDateTime;
  }

  getStartDateTime()
  {
    if(this.startDateTime){
      return this.startDateTime;
    }
  }
}

export default new ClockManager();