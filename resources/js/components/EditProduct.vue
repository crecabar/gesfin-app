<template>

</template>

<script>
export default {
    data() {
        return {
            product: {}
        }
    },
    created() {
        this.axios
            .get(`${this.$apiURL}/products/${this.$route.params.id}`)
            .then((res) => {
                this.product = res.data;
            })
    },
    methods: {
        updateProduct() {
            this.axios
                .patch(`${this.$apiURL}/products/${this.$route.params.id}`)
                .then((res) => {
                    this.$router.push({name: 'home'});
                });
        }
    }
}
</script>

<style scoped>

</style>
