#!/usr/bin/env python
import numpy as np
from ase import Atoms
from ase import Atom
from ase.structure import bulk
from ase.io.trajectory import PickleTrajectory
from ase.optimize.bfgs import BFGS
from gpaw import GPAW
from gpaw import PW
from gpaw import FermiDirac

#silicon = bulk('Si', 'diamond', a=5.459)
#from gpaw.eigensolvers import Davidson #ska denna vara med?

# OBS välj en av de olika strukturerna!!!!!!!!
structure = 1 # 1 for fcc, 2 for bcc, 3 for sc
atomTypes = ['Al', 'Mg']
selectType = [1,0,0,0]

cutoff = 300

mol = Atoms()
  
if structure == 1: 
  #fcc
  p = ((0,0,0),(lattice/2, lattice/2, 0),(lattice/2, 0, lattice/2),(0,lattice/2, lattice/2))
if structure == 2:
  #bcc
  p = ((0,0,0),(lattice/2, lattice/2, lattice/2),(lattice, 0, 0),(3*lattice/2,lattice/2, lattice/2))
if structure == 3:
  #sc
  p = ((0,0,0), (lattice,0,0), (2*lattice, 0, 0), (3*lattice,0,0))
  

for i in range(4):
  atom = Atom(atomTypes[selectType[i]], p[i])
  mol.append(atom)

if structure == 1:
  #fcc
  mol.cell = [lattice, lattice, lattice]
if structure == 2:
  #bcc
  mol.cell = [2*lattice, lattice, lattice]
if structure == 3:
  #sc
  mol.cell = [4*lattice, lattice, lattice]
  
mol.pbc = True

calc=GPAW(mode=PW(400),                 # Energycutoff for planewaves [eV] 
           basis='dzp',
           h=0.2,                       # The distance between gridpoints AA^-1
           xc='PBE',                    # xc-functional
           nbands=20,                   # number of bands
           kpts=(20,20,20),             # number of k-points
           occupations=FermiDirac(0.1), # Fermi temperature [eV]
           txt='out_task2.txt')
mol.set_calculator(calc)
mol.get_potential_energy()

calc.write('mol.gpw', mode='all')



