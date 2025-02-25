"env-binding": {
	type: "policy"
	annotations: {}
	labels: {}
	description: "Provides differentiated configuration and environment scheduling policies for application."
}
template: {
	output: {
		apiVersion: "core.oam.dev/v1alpha1"
		kind:       "EnvBinding"
		spec: {
			engine: parameter.clusterManagementEngine
			appTemplate: {
				apiVersion: "core.oam.dev/v1beta1"
				kind:       "Application"
				metadata: {
					name:      context.appName
					namespace: context.namespace
				}
				spec: {
					components: context.components
				}
			}
			envs: parameter.envs
			outputResourcesTo: {
				name:      context.name
				namespace: context.namespace
			}
		}
	}
	#Env: {
		name: string
		patch: components: [...{
			name: string
			type: string
			properties: {...}
			traits?: [...{
				type: string
				properties: {...}
			}]
		}]
		placement: {
			clusterSelector?: {
				labels?: [string]: string
				name?: string
			}
			namespaceSelector?: {
				labels?: [string]: string
				name?: string
			}
		}
	}
	parameter: {
		clusterManagementEngine: *"ocm" | string
		envs: [...#Env]
	}
}
