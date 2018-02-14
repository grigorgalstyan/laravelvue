<script>

import auth from '../js/auth.js'



export default {

    data() {
			auth.check();
			var userlogname = localStorage.getItem('name');
            return {
                auth: auth
				
            }
			
        },
        methods: {
            signout() {
                auth.signout()
            },
			check2() {
                auth.check2()
            }
        },
        mounted: function () {
            this.$nextTick(function () {
                auth.check2()
            })
        },
		ready() {
			auth.check2()
			var userlogname = localStorage.getItem('name');
		}
		
		
}


</script>

<template>
    <div class="panel panel-default">
        <div class="panel-heading">

			<nav>
				<ul class="list-inline">
				
					<li>
						<router-link :to="{ name: 'home' }">Home</router-link>
					</li>
					<li class="pull-right" v-if="!auth.user.authenticated">
						<router-link :to="{ name: 'register' }">Register</router-link>
					</li>
					<li class="pull-right" v-if="!auth.user.authenticated">
						<router-link :to="{ name: 'signin' }">Sign in</router-link>
					</li>
					<li class="pull-right" v-if="auth.user.authenticated">
						<a href="javascript:void(0)" v-on:click="signout">Sign out</a>
					</li>
					
					<li class="pull-right" v-if="auth.user.authenticated">
						<router-link :to="{ name: 'dashboard' }">Member area </router-link>
					</li>
					<li class="pull-right" v-if="auth.user.authenticated">
						
						<span v-if=auth.user.profile.name>
						
					
						{{ auth.user.profile.name }}  {{ auth.user.profile.membertype }} 
						<div v-if="auth.user.profile.membertype === 'admin'">
						<router-link :to="{ name: 'dashboard1' }"> Full Admin </router-link>
						 
						</div>
						<div v-else-if="auth.user.profile.membertype === 'user'">
						<router-link :to="{ name: 'dashboard2' }"> User Level </router-link>
						  
						</div>
						<div v-else-if="auth.user.profile.membertype === 'coordinator'">
						<router-link :to="{ name: 'dashboard3' }"> Coordinator </router-link>
						  
						</div>
						<div v-else>
						  Not logged in
						</div>
							
				
						</span>
						<span v-else>
						After refresh  {{ auth.user.name  }}
						</span>
					
					</li>

					<li class="pull-right" >
						<router-link :to="{ name: 'dashboard' }">  &raquo;  Dashboard  </router-link>
						
					</li>
					
				</ul>
			</nav>

        </div>
        <div class="panel-body">
            <router-view></router-view>
        </div>
    </div>
</template>


