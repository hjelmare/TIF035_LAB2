from gpaw import GPAW
from ase import Atoms
from ase import Atom
import numpy as np
from ase.io.trajectory import PickleTrajectory
from ase.optimize.bfgs import BFGS
from gpaw.eigensolvers import Davidson
from gpaw import PW



structure = 1 # 1 for fcc, 2 for bcc, 3 for sc
atomTypes = ['Al', 'Mg']
selectType = [0,0,0,0]

lattice = 4
minCutoff = 100
maxCutoff = 600
nCutoffSteps = 11

cutoffSteps = np.linspace(minCutoff, maxCutoff, nCutoffSteps)

for cutoff in cutoffSteps:
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



  calc = GPAW(mode=PW(cutoff), h = 0.2, xc='PBE', nbands = 24, eigensolver='dav', kpts = (6,6,6), txt='out_home.txt')

  mol.set_calculator(calc)
  energy = mol.get_potential_energy()
  print(str(cutoff) + '\t' + str(energy))


