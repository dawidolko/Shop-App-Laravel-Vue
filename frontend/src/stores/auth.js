// src/stores/auth.js
import { defineStore } from "pinia";

export const useAuthStore = defineStore("authStore", {
  state: () => ({
    user: null,
    errors: {},
  }),
  actions: {
    /******************* Get authenticated user *******************/
    async getUser() {
      const token = localStorage.getItem("token");
      if (token) {
        try {
          const res = await fetch("/api/user", {
            headers: {
              authorization: `Bearer ${token}`,
            },
          });
          if (!res.ok) {
            console.error("Unauthorized: token may be invalid or expired");
            this.user = null;
            return;
          }
          const data = await res.json();
          this.user = data;
        } catch (error) {
          console.error("Error fetching user:", error);
          this.user = null;
        }
      }
    },
    /******************* Login or Register user *******************/
    async authenticate(apiRoute, formData) {
      const res = await fetch(`/api/${apiRoute}`, {
        method: "post",
        body: JSON.stringify(formData),
      });
      const data = await res.json();

      if (data.errors) {
        this.errors = data.errors;
      } else {
        this.errors = {};
        localStorage.setItem("token", data.token);
        this.user = data.user;
        this.router.push({ name: "home" }); // przeniesienie na stronę główną
      }
    },
    /******************* Logout user *******************/
    async logout() {
      const res = await fetch("/api/logout", {
        method: "post",
        headers: {
          authorization: `Bearer ${localStorage.getItem("token")}`,
        },
      });

      const data = await res.json();
      console.log(data);

      if (res.ok) {
        this.user = null;
        this.errors = {};
        localStorage.removeItem("token");
        this.router.push({ name: "home" });
      }
    },
  },
});
