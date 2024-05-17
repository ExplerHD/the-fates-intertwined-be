import * as mc from '@minecraft/server';

declare module "@minecraft/server" {
    interface Player {
        atkcd: number;
        dashcd: number;
    }
}