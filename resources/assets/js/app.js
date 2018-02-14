import Vue from 'vue';
import VueRouter from 'vue-router';
import VueResource from 'vue-resource';
import App from '../components/App.vue';
import Dashboard from '../components/Dashboard.vue';
import Dashboard1 from '../components/Dashboard1.vue';
import Dashboard2 from '../components/Dashboard2.vue';
import Dashboard3 from '../components/Dashboard3.vue';
import Home from '../components/Home.vue';
import Register from '../components/Register.vue';
import Signin from '../components/Signin.vue';

import { Store } from 'vuex' ;
import createPersistedState from 'vuex-persistedstate' ;
import Cookie from "js.cookie";
//import * as Cookies from 'js-cookie' ;



Vue.use(VueRouter);
Vue.use(VueResource);

Vue.http.headers.common['X-CSRF-TOKEN'] = document.getElementsByName('csrf-token')[0].getAttribute('content');
Vue.http.headers.common['Authorization'] = 'Bearer ' + localStorage.getItem('id_token');
Vue.http.options.root = 'http://127.0.0.1:8000/';

export default Vue;






export var router = new VueRouter({
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home
        },
        {
            path: '/dashboard',
            name: 'dashboard',
            component: Dashboard	
        },
		{
            path: '/dashboard1',
            name: 'dashboard1',
            component: Dashboard1	
        },
		{
            path: '/dashboard2',
            name: 'dashboard2',
            component: Dashboard2	
        },
		{
            path: '/dashboard3',
            name: 'dashboard3',
            component: Dashboard3	
        },
		
        {
            path: '/register',
            name: 'register',
            component: Register
        },
        {
            path: '/signin',
            name: 'signin',
            component: Signin
        }
    ]
});


router.beforeEach((to, from, next) => {
    if(to.path == '/dashboard') 
	{
        if(checkToken()) 
		{  
			next();
        } 
		else 
		{  
            next('signin');
        }
    } 
	else if(to.path == '/dashboard1') 
	{
        if(checkLevel1()) 
		{  
			next();
        } 
		else 
		{  
            next('dashboard');
        }
    } 
	else if(to.path == '/dashboard2') 
	{
        if(checkLevel2()) 
		{  
			next();
        } 
		else 
		{  
            next('dashboard');
        }
    } 
	else if(to.path == '/dashboard3') 
	{
        if(checkLevel3()) 
		{  
			next();
        } 
		else 
		{  
            next('dashboard');
        }
    } 
	else 
	{
        
        next(); // This is where it should have been
    }
    // next(); - This is in the wrong place
});

function checkToken() {
    
	let token = localStorage.getItem('id_token')
	let loggedname = localStorage.getItem('name')
	let loggedemail = localStorage.getItem('email')
	if (token !== null && loggedname !== null && loggedemail !== null ) 
	{
		return true;
	}
	else
	{
		return false;
	}

}

function checkLevel1() {
    
	let token = localStorage.getItem('id_token')
	let loggedname = localStorage.getItem('name')
	let loggedemail = localStorage.getItem('email')
	let loggedtype = localStorage.getItem('membertype')
	
	if (token !== null && loggedname !== null && loggedemail !== null && loggedtype=='admin') 
	{
		return true;
	}
	else
	{
		return false;
	}

}

function checkLevel2() {
    
	let token = localStorage.getItem('id_token')
	let loggedname = localStorage.getItem('name')
	let loggedemail = localStorage.getItem('email')
	let loggedtype = localStorage.getItem('membertype')
	
	if (token !== null && loggedname !== null && loggedemail !== null &&  (loggedtype=='admin' || loggedtype=='user') ) 
	{
		return true;
	}
	else
	{
		return false;
	}

}

function checkLevel3() {
    
	let token = localStorage.getItem('id_token')
	let loggedname = localStorage.getItem('name')
	let loggedemail = localStorage.getItem('email')
	let loggedtype = localStorage.getItem('membertype')
	
	if (token !== null && loggedname !== null && loggedemail !== null &&  (loggedtype=='admin' || loggedtype=='user'  || loggedtype=='coordinator') ) 
	{
		return true;
	}
	else
	{
		return false;
	}

}


new Vue({
    el: '#app',
    router: router,
    render: app => app(App)
});